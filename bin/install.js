#!/usr/bin/env node
const fs = require('fs-extra');
const path = require('path');

var currentPath = process.cwd();
fs.copySync(path.join(__dirname, '..', 'Dockerfile'), path.join(currentPath, 'Dockerfile'));
fs.copySync(path.join(__dirname, '..', 'Aptfile'), path.join(currentPath, 'Aptfile'));
