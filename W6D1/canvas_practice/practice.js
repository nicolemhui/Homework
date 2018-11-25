document.addEventListener("DOMContentLoaded", function(){
  const canv = document.getElementById("mycanvas");
  canv.width = 500;
  canv.height = 500;

  const ctx = canv.getContext('2d');
  ctx.fillStyle = 'blue';
  //x, y, width, height
  ctx.fillRect(0, 0, 500, 500);

  ctx.beginPath();
  // x, y, radius, startAngle, endAngle [, anticlockwise]
  ctx.arc(100, 75, 50, 0, 2 * Math.PI);
  ctx.strokeStyle = 'yellow';
  ctx.lineWidth = 5;
  ctx.stroke();
  ctx.fillStyle = 'yellow';
  ctx.fill();
});
