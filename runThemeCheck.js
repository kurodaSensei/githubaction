const { exec } = require('child_process');
const cwd = process.cwd()
exec(`${cwd}/node_modules/.bin/shopify theme check`, (error, stdout, stderr) => {
    if (error) {
        console.error(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.error(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
});
