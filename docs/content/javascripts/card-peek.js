// Card mentions are written <span class="card">![](x.webp){ .card-icon } Name</span>.
// This wraps the name in span.card-name, which extra.css underlines, and adds the
// whole card (x.full.webp, from `just card-icons`) as a preview shown on hover or
// keyboard focus. Without JS the mention is plain icon + name, with no underline
// promising a preview that isn't there.
function addCardPeeks() {
  for (const card of document.querySelectorAll(".md-typeset .card")) {
    const icon = card.querySelector("img.card-icon");
    if (!icon || card.querySelector("img.card-peek")) continue;
    const peek = document.createElement("img");
    peek.className = "card-peek";
    peek.alt = "";
    peek.decoding = "async";
    peek.src = icon.getAttribute("src").replace(/\.webp$/, ".full.webp");
    card.prepend(peek);

    // Everything after the icon, minus the space that separates them, is the name.
    const name = document.createElement("span");
    name.className = "card-name";
    let node = icon.nextSibling;
    if (node && node.nodeType === Node.TEXT_NODE) {
      const space = node.data.match(/^\s+/);
      if (space) node = node.splitText(space[0].length);
    }
    while (node) {
      const next = node.nextSibling;
      name.append(node);
      node = next;
    }
    card.append(name);
    card.tabIndex = 0;
  }
}

if (window.document$) {
  window.document$.subscribe(addCardPeeks); // Zensical's instant navigation
} else {
  addCardPeeks();
}
