# glsl-dof

Physically accurate depth of field calculated from a vertex position.

Based on a [post](http://devlog-martinsh.blogspot.com/2011/12/glsl-depth-of-field-with-bokeh-v24.html) from [Martins Upitis](https://github.com/martinsh) and with the help of this [thread](https://www.gamedev.net/forums/topic/515838-calculate-depth-value-in-vertex-shader/).

## Example

```glsl
#pragma glslify: dof = require('glsl-dof')

void main() {
	vec4 finalPosition = projectionMatrix * modelViewMatrix * vec4(position, 1.0);

	float depth = finalPosition.z / finalPosition.w;
	float focalDepth = 1.5;
	float d = dof(depth, focalDepth);
}
```

## Install

Use [npm](https://www.npmjs.com/) to install and [glslify](https://github.com/stackgl/glslify) to consume the function in your shaders.

```sh
npm install glsl-dof
```

## Usage

[![NPM](https://nodei.co/npm/glsl-dof.png)](https://www.npmjs.com/package/glsl-dof)

#### `float dof(float depth, float focalDepth)`

Default values: `focalLength` = 100.0, `fstop` = 2.0, `near` = 0.01 and `far` = 100.0.

#### `float dof(float depth, float focalDepth, float focalLength, float fstop, float near, float far)`

## License

MIT, see [LICENSE.md](LICENSE.md) for details.