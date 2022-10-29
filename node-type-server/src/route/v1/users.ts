import express from 'express';

const router = express.Router();

// GETリクエスト
router.get('/', (req: express.Request, res: express.Response) => {
  try {
    res.status(200).json([
      {
        "id": {
          "rawValue": 44838949
        },
        "name": "Dai Kawahara",
        "birthDay": "1992/05/31" 
      },
      {
        "id": {
          "rawValue": 44838948
        },
        "name": "Manami Kawahara",
        "birthDay": "1991/10/20" 
      }
    ]);
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
});

// POSTリクエスト
router.post('/', (req: express.Request, res: express.Response) => {
  try {
    res.status(200).json({ message: "登録しました" });
  } catch (error: any) {
    res.status(400).json({ message: error.message });
  }
});

export default router;
