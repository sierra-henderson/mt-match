const db = require('../database');

const getAuth = (req, res, next) => {
  const { userId } = req.session;
  if (!userId) {
    return res.json({ username: null });
  }
  const sql = `
    select "u"."username",
           "u"."userId",
           count("lm"."musicalId") as "numLiked"
      from "users"
      join "likedMusicals" as "lm" using ("musicalId")
      where "userId" = $1
  `;
  const params = [userId];
  db.query(sql, params)
    .then(result => {
      req.session.userId = result.rows[0].userId;
      res.json(result.rows[0]);
    })
    .catch(err => next(err));
};

module.exports = getAuth;
