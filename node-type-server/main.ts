import * as http from "http";

class Main {
    constructor() {
        // httpサーバーの設定をします。
        const server: http.Server = http.createServer(
            (
                request: http.IncomingMessage,
                response: http.ServerResponse
            ) => this.requestHandler(request, response)
        );

        // サーバーを起動します。
        server.listen('5000');
    }

    private requestHandler(request: http.IncomingMessage, 
                           response: http.ServerResponse): void {
        response.end("Hello! Node.js With TypeScript!")
    }
}

const main = new Main();