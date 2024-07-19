const { app, BrowserWindow, ipcMain } = require('electron');
const { exec } = require('child_process');
const os = require('os');

function createWindow() {
    const win = new BrowserWindow({
        width: 1000,
        height: 800,
        webPreferences: {
            nodeIntegration: true,
            contextIsolation: false
        }
    });

    win.loadFile('src/index.html');
}

app.whenReady().then(createWindow);

app.on('window-all-closed', () => {
    if (process.platform !== 'darwin') {
        app.quit();
    }
});

app.on('activate', () => {
    if (BrowserWindow.getAllWindows().length === 0) {
        createWindow();
    }
});

ipcMain.on('verify-input', (event, { type, input }) => {
    let command;
    const isWindows = os.platform() === 'win32';
    const sanitizedInput = input.replace(/"/g, '\\"'); // Escapar comillas dobles

    if (type === 'username') {
        command = `echo ${sanitizedInput} | ${isWindows ? '.\\verificador_username.exe' : './verificador_username'}`;
    } else if (type === 'email') {
        command = `echo ${sanitizedInput} | ${isWindows ? '.\\verificador_email.exe' : './verificador_email'}`;
    } else if (type === 'password') {
        command = `echo ${sanitizedInput} | ${isWindows ? '.\\verificador_password.exe' : './verificador_password'}`;
    }

    // Imprimir el comando para verificar
    console.log(`Ejecutando comando: ${command}`);

    exec(command, { shell: isWindows ? 'cmd.exe' : '/bin/bash' }, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error: ${error.message}`);
            event.reply('verification-result', `Error: ${error.message}`);
            return;
        }
        if (stderr) {
            console.error(`stderr: ${stderr}`);
            event.reply('verification-result', `stderr: ${stderr}`);
            return;
        }
        event.reply('verification-result', stdout.trim()); // Trim para eliminar posibles nuevas líneas
    });
});
