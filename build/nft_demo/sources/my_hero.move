module nft_demo::my_hero {
    use sui::tx_context::{Self, TxContext};
    use std::string::{Self, String};
    use sui::transfer;
    use sui::object::{Self, UID};

    use sui::package;
    use sui::display;

    struct Hero has key, store {
        id: UID,
        name: String,
        img_url: String,
        description: String,
        creator: String
    }

    /// One-Time-Witness for the module.
    /// must drop and same as module name but capitalize
    struct MY_HERO has drop {}
    
    fun init(otw: MY_HERO, ctx: &mut TxContext) {
        let keys = vector[
            string::utf8(b"name"),
            string::utf8(b"link"),
            string::utf8(b"image_url"),
            string::utf8(b"description"),
            string::utf8(b"project_url"),
            string::utf8(b"creator"),
        ];

        let values = vector[
            // For `name` we can use the `Hero.name` property
            string::utf8(b"{name}"),
            // For `link` we can build a URL using an `id` property
            string::utf8(b"https://sui-heroes.io/hero/{id}"),
            // For `image_url` we use an ipfs :// + `img_url` or https:// + `img_url`.
            string::utf8(b"{img_url}"),
            // Description is static for all `Hero` objects.
            string::utf8(b"{description}"),
            // Project URL is usually static
            string::utf8(b"https://sui-heroes.io"),
            // Creator field can be any
            string::utf8(b"{creator}")
        ];

        // Claim the `Publisher` for the package!
        let publisher = package::claim(otw, ctx);

        // Get a new `Display` object for the `Hero` type.
        let display = display::new_with_fields<Hero>(
            &publisher, keys, values, ctx
        );

        // Commit first version of `Display` to apply changes.
        display::update_version(&mut display);

        transfer::public_transfer(publisher, tx_context::sender(ctx));
        transfer::public_transfer(display, tx_context::sender(ctx));
    }

    /// Anyone can mint their `Hero`!
    public entry fun mint(
        name: String,
        img_url: String,
        description: String,
        creator: String,
        ctx: &mut TxContext
    ) {
        let id = object::new(ctx);

        let hero = Hero { 
            id, 
            name, 
            img_url,
            description,
            creator
        };

        transfer::public_transfer(hero, tx_context::sender(ctx));
    }

    /// Permanently delete `nft`
    public entry fun burn(nft: Hero) {
        let Hero {
            id,
            name: _ ,
            img_url: _ ,
            description: _ ,
            creator:_
        } = nft;
        object::delete(id);
    }
}