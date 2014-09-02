# FollowMouse

Ever wanted to make the visitors on your website know that someone is watching them? Wanted to create a big brother style effect? Or simply just wanted tomove an element around the page based on the mouse position in the browser? Look no further!

**FollowMouse** is an easy to use, lightweight (Less than **1.5kb** minified!) JavaScript plugin that will position any element within its containing box based on the position of the mouse. To ensure it is fully lightweight ther is no dependency on jQuery instead it uses vanilla JavaScript to ensure for speed of execution!

Can be installed through Bower

```
bower install followmouse
```

## Usage

To use the script simply include it on the page

```html
<script src="../dist/js/FollowMouse.min.js"></script>
```

Then initialize the plugin in your JavaScript

```javascript
new FollowMouse(".js-mouse");
```

You can include either a selector class or ID, or pass in a JavaScript object.

## Example

Check the example folder for some creepy eyes following you around the page!

## Browser Support

Tested in all major browsers and it works fine.

It works fine in IE9+. However, in IE9 it uses 2D transforms instead of 3D transforms so performance might not be as good as other browsers.
