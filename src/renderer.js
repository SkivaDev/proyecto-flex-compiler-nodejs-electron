const { ipcRenderer } = require('electron');

function verifyUsername() {
    const username = document.getElementById('username').value;
    ipcRenderer.send('verify-input', { type: 'username', input: username });
}

function verifyEmail() {
    const email = document.getElementById('email').value;
    ipcRenderer.send('verify-input', { type: 'email', input: email });
}

function verifyPassword() {
    const password = document.getElementById('password').value;
    ipcRenderer.send('verify-input', { type: 'password', input: password });
}

ipcRenderer.on('verification-result', (event, result) => {
    document.getElementById('output').textContent = result;
});
