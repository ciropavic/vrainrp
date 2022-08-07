let drag = false;
let currentColor = "rgb(255, 0, 0);";
let cursorX, cursorY;

let preview;
let colorBlock, colorStrip;
let blockCtx, stripCtx;

let cachedColor = [255, 255, 255];

const mousedown = (e, ctx) => {
  drag = true;
  updatePreview(e, ctx);
};

const mouseup = () => {
  drag = false;
};

const mousemove = (e, ctx) => {
  if (drag) {
    updatePreview(e, ctx);
  }
};

const updatePreview = (e, ctx) => {
  cursorX = e.offsetX;
  cursorY = e.offsetY;

  let imageData = ctx.getImageData(cursorX, cursorY, 1, 1).data;
  currentColor = `rgba(${imageData.slice(0, 3).join(", ")}, 1)`;
  cachedColor = [parseInt(imageData[0]), parseInt(imageData[1]), parseInt(imageData[2])];

  preview.style.setProperty("--color", currentColor);

  if (ctx == stripCtx) updatePalette();
};

const updatePalette = () => {
  blockCtx.fillStyle = currentColor;
  blockCtx.fillRect(0, 0, colorBlock.width, colorBlock.height);

  var grdWhite = stripCtx.createLinearGradient(0, 0, colorBlock.width, 0);
  grdWhite.addColorStop(0, "rgba(255,255,255,1)");
  grdWhite.addColorStop(1, "rgba(255,255,255,0)");
  blockCtx.fillStyle = grdWhite;
  blockCtx.fillRect(0, 0, colorBlock.width, colorBlock.height);

  var grdBlack = stripCtx.createLinearGradient(0, 0, 0, colorBlock.height);
  grdBlack.addColorStop(0, "rgba(0,0,0,0)");
  grdBlack.addColorStop(1, "rgba(0,0,0,1)");
  blockCtx.fillStyle = grdBlack;
  blockCtx.fillRect(0, 0, colorBlock.width, colorBlock.height);
};

const useDefaultColor = (elem) => {
  const color = elem.style.getPropertyValue("--color");
  currentColor = color;
  preview.style.setProperty("--color", color);

  const vals = color.substring(color.indexOf("(") + 1, color.length - 1).split(", ");
  cachedColor = [parseInt(vals[0]), parseInt(vals[1]), parseInt(vals[2])];
};

const main = () => {
  colorBlock = document.getElementById("colorpicker-block");
  blockCtx = colorBlock.getContext("2d");

  colorStrip = document.getElementById("colorpicker-strip");
  stripCtx = colorStrip.getContext("2d");

  preview = document.getElementById("color-label");

  currentColor = "rgba(255,0,0,1)";

  blockCtx.rect(0, 0, colorBlock.width, colorBlock.height);
  updatePalette();

  stripCtx.rect(0, 0, colorStrip.width, colorStrip.height);
  var grd1 = stripCtx.createLinearGradient(0, 0, 0, colorBlock.height);
  grd1.addColorStop(0, "rgba(255, 0, 0, 1)");
  grd1.addColorStop(0.17, "rgba(255, 255, 0, 1)");
  grd1.addColorStop(0.34, "rgba(0, 255, 0, 1)");
  grd1.addColorStop(0.51, "rgba(0, 255, 255, 1)");
  grd1.addColorStop(0.68, "rgba(0, 0, 255, 1)");
  grd1.addColorStop(0.85, "rgba(255, 0, 255, 1)");
  grd1.addColorStop(1, "rgba(255, 0, 0, 1)");
  stripCtx.fillStyle = grd1;
  stripCtx.fill();

  colorBlock.onmousedown = (e) => mousedown(e, blockCtx);
  colorBlock.onmouseup = (e) => mouseup(e, blockCtx);
  colorBlock.onmousemove = (e) => mousemove(e, blockCtx);

  colorStrip.onmousedown = (e) => mousedown(e, stripCtx);
  colorStrip.onmouseup = (e) => mouseup(e, stripCtx);
  colorStrip.onmousemove = (e) => mousemove(e, stripCtx);

  document.onmouseup = () => {
    if (drag) drag = false;
  };
};

const Colorpicker = {};

Colorpicker.element = document.getElementById("colorpicker");

Colorpicker.open = () => {
  Colorpicker.opened = true;
  Colorpicker.element.classList.add("colorpicker-open");
  setTimeout(() => {
    Colorpicker.element.classList.remove("colorpicker-open");
    Colorpicker.element.style.display = "flex";
  }, 2000);
};

Colorpicker.close = () => {
  Colorpicker.opened = false;
  Colorpicker.element.classList.add("colorpicker-close");
  setTimeout(() => {
    Colorpicker.element.classList.remove("colorpicker-close");
    Colorpicker.element.style.display = "none";
  }, 1400);
};

Colorpicker.submit = () => {
  if (cachedColor) {
    $.post(
      "http://scarshop/updatecolor",
      JSON.stringify({
        color: [cachedColor[0], cachedColor[1], cachedColor[2]],
      })
    );
  }
};

Colorpicker.value = () => {
  return currentColor;
};

main();
