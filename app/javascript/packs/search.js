const searchInput = document.querySelector('.header__search input');
const searchResults = document.querySelector('#search-results');  // 検索結果を表示するエリア

if (searchInput) {
  searchInput.addEventListener('keyup', function() {
    let query = this.value;

    if (query === '') {
      searchResults.innerHTML = '';  // クエリが空の場合、検索結果をクリア
      return;
    }

    fetch('/search?q=' + query)
      .then(response => response.json())
      .then(data => {
        let html = '';

        // 投稿の検索結果を追加
        data.posts.forEach(post => {
          html += `<div><a href="/posts/${post.id}">${post.title}</a></div>`;
        });

        // ユーザーの検索結果を追加
        data.users.forEach(user => {
          html += `<div><a href="/users/${user.id}">${user.name}</a></div>`;
        });

        // パーク（コミュニティ）の検索結果を追加
        data.parks.forEach(park => {
          html += `<div><a href="/parks/${park.id}">${park.name}</a></div>`;
        });

        searchResults.innerHTML = html;
      });
  });
}