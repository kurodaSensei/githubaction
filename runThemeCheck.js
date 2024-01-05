const { exec } = require('child_process');
const { getExecOutput } = require('@actions/exec');
const cwd = process.cwd();
async function runChecksJson() {
  const { exitCode, stdout } = await getExecOutput(
    `${cwd}/node_modules/.bin/shopify`,
    [
      'theme',
      'check',
      ...['--output', 'json'],
    ].filter(x => Boolean(x)),
    {
      silent: true,
      ignoreReturnCode: true,
    },
  );

  return {
    exitCode,
    report: JSON.parse(stdout),
  };
}

runChecksJson().then(({ exitCode, report }) => {
  console.log('exitCode', exitCode);
  console.log('report', report);
});

/* exec(`theme-check -o json .`, (error, stdout, stderr) => {
    if (error) {
        console.error(`error: ${error.message}`);
        return;
    }
    if (stderr) {
        console.error(`stderr: ${stderr}`);
        return;
    }
    console.log(`stdout: ${stdout}`);
}); */
