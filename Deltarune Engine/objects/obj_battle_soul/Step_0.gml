/// @desc
#region input and movement
var horizontal = input_check("right") - input_check("left");
var vertical = input_check("down") - input_check("up");
var slow = input_check("cancel");

slowing = slow;

var moveSpeed = slowing ? slowSpeed : normSpeed;

var moveX = horizontal * moveSpeed;
var moveY = vertical * moveSpeed;

var moving = (moveX != 0 || moveY != 0);

x += moveX;
y += moveY;

x = clamp(x,_l,_r);
y = clamp(y,_t,_b);

#endregion