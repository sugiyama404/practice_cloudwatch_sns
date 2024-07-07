const express = require('express');
const app = express();

// 各ルートの設定
const routes = [
    { path: '/', action: 'index', message: 'ホーム画面です\n' },
    { path: '/about', action: 'about', message: 'これはAboutページです\n' },
    { path: '/faq', action: 'faq', message: 'これはFAQページです\n' },
    { path: '/portfolio', action: 'portfolio', message: 'これはPortfolioページです\n' },
    { path: '/error', action: 'error', message: 'これはerrorページです\n' },
];

routes.forEach(route => {
    app.get(route.path, (req, res) => {
        try {
            if (route.action === 'error') {
                throw new Error('An error page was accessed.');
            } else {
                console.log(route.action);
                res.send(route.message);
            }
        } catch (err) {
            console.error('Fatal error:', err.message);
            res.status(500).send('致命的なエラーが発生しました\n');
        }
        res.send(route.message);
    });
});

app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
