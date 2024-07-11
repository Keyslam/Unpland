var fs = require('fs');
var exec = require('child_process').execSync;
var files = fs.readdirSync('../resources');

const re = new RegExp("(.)*.ase");
files
	.filter(x => x.match(re))
	.forEach(file => {
		const name = file.substring(0, file.length - 4)

		console.log(`Exporting '${file}'`);
		const cmd = `aseprite -b ../resources/${file} --sheet ../game/assets/${name}.png --data ../game/assets/${name}.json --split-tags --list-slices --sheet-pack --filename-format {tag}-{tagframe}`
		exec(cmd, function (error, stdout, stderr) {
			if (error !== null) {
				console.log('exec error: ' + error);
			}
		});
	});
