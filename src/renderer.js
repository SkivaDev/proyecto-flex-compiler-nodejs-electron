const { ipcRenderer } = require('electron');

document.getElementById('verifier-form').addEventListener('submit', (event) => {
    event.preventDefault();
    const input = document.getElementById('input').value;
    ipcRenderer.send('verify-input', input);
});

ipcRenderer.on('verification-result', (event, result) => {
    document.getElementById('output').textContent = result;
});
