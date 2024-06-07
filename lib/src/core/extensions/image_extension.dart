extension ImagesPaths on String {
  toSvg() {
    return "assets/svg/$this.svg";
  }

  toLottie() {
    return "assets/lottie/$this.json";
  }

  toPNG() {
    return "assets/images/$this.png";
  }

  toJPG() {
    return "assets/images/$this.jpg";
  }

  toEmoji() {
    return "assets/emojis/$this.png";
  }
}
