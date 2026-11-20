# Frequently Asked Questions

## Where can I get other tarot decks?

We provide a small number of free tarot decks (as of 2026, four) in our [Reference Deck Collection](https://github.com/arcanaland/reference-decks/releases). They are all available for download directly in the Tarot Canvas app.

Because there are only a handful of tarot decks in existence that are verifiably free from copyright claim, we are only able to provide a small sample of decks that are permissively licensed. For other decks, you can create your own by following the next section.

## How do I make my own deck?

Creating a tarot deck consists of putting your card images into a certain folder structure with a TOML file at the top.

This section will walk-through creating a tarot deck step-by-step using KDE Plasma.

Open Dolphin and navigate to `~/.var/app/land.arcana.TarotCanvas/data/tarot/decks`. Create a directory called `my-tarot-deck` (or name it whatever).

Then create a new TOML file called `deck.toml` and fill it out:

```toml
[deck]
schema_version = "2.0"
name = "My Tarot Deck"
author = "Jane Doe"
version = "1.0"
identifier = "com.example/deck/my-tarot-deck"
```

<img width="1958" height="1382" alt="deck1" src="deck1.webp" />

For this example, I will be using images from Kathryn Isabelle Lawrence's [ascii-tarot](https://github.com/lawreka/ascii-tarot).

Place major arcana images in a folder called `major_arcana` and name them as a two-digit number. Using The Fool, as an example place it in `major_arcana/00.webp`.

<img width="1958" height="1382" alt="deck3" src="deck3.webp" />

For the minor arcana, create a folder named `minor_arcana` with subfolders `wands`, `cups`, `swords`, and `pentacles`. For example:

<img width="2114" height="1622" alt="deck4" src="deck4.webp" />

Follow the example of `minor_arcana/cups/ace.webp` and `minor_arcana/swords/three.webp` for the rest of the cards.

<img width="2126" height="1572" alt="canvas" src="canvas.webp" />

You should now be able use the canvas view with "My Custom Tarot" selected in the Card Explorer's dropdown. Summoning random cards will then draw from your personal deck.


!!! tip
    Refer to the full [Tarot Deck Specification](https://github.com/arcanaland/specifications/blob/main/DECK.md) ([PDF](https://github.com/arcanaland/specifications/releases/download/deck%2Fv2.0-rc.1/deck-v2.0-rc.1.pdf)) for more details about the file and directory format.

!!! note
    I personally scan my decks using an app that I am developing called [deckle](https://github.com/arcanaland/deckle). It is a command-line tool that handles the scanning, physical jig creation, image cropping, deskeweing and cataloging. It is pre-alpha, but if you are technical and adventurous, it may be of interest.


## How do I add my own keywords for cards?

You can add your own esoterica by manually creating a file with the following format:

```toml
[meta]
name = "My Custom Keywords"
identifier = "land.arcana.private/esoterica/my-keywords"
schema_version = "1.0"
version = "1.0"

# keywords for The Fool
[card."major_arcana.00".passages]
keywords = ["tomfoolery", "this chicanery‽"]

# keywords for the Eight of Wands
[card."minor_arcana.wands.eight".passages]
keywords = ["fast movement", "rain of arrows"]
```

Save it as a `.toml` file in the folder at `~/.var/app/land.arcana.TarotCanvas/data/tarot/esoterica/`.

<img width="2150" height="1516" alt="Screenshot_20261008_174224-1" src="./custom-keywords.webp" />


!!! note
    See the official [Esoterica Specification](https://github.com/arcanaland/specifications/blob/deck-v2/ESOTERICA.md) for the supported fields.
