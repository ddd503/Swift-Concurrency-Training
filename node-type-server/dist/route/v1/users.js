"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var express_1 = __importDefault(require("express"));
var router = express_1.default.Router();
// GETリクエスト
router.get('/', function (req, res) {
    try {
        res.status(200).json({
            "id": {
                "rawValue": 44838949
            },
            "full_name": "apple/swift",
            "owner": {
                "login": "apple",
                "id": {
                    "rawValue": 10639145
                }
            }
        });
    }
    catch (error) {
        res.status(400).json({ message: error.message });
    }
});
// POSTリクエスト
router.post('/', function (req, res) {
    try {
        res.status(200).json({ message: "登録しました" });
    }
    catch (error) {
        res.status(400).json({ message: error.message });
    }
});
exports.default = router;
//# sourceMappingURL=users.js.map