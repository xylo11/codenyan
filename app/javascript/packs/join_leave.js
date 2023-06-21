document.addEventListener('DOMContentLoaded', function() {
  const joinLeaveBtn = document.querySelector('#join-leave-btn');
  
  if (joinLeaveBtn) {
    joinLeaveBtn.addEventListener('click', function(e) {
      e.preventDefault(); // ページの再読み込みを防ぐ

      let action = e.target.textContent.toLowerCase().trim();
      let httpMethod = action === 'join' ? 'POST' : 'DELETE'; // actionに基づいてHTTPメソッドを設定

      fetch(`/parks/${e.target.dataset.parkId}/${action}`, {
        method: action === 'join' ? 'POST' : 'DELETE',
        headers: {
          'Content-Type': 'application/json',
          'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
        },
        body: JSON.stringify({ park_id: e.target.dataset.parkId }),
        credentials: 'same-origin'
      })
      .then(response => response.json())
      .then(data => {
        if (data.success) {
          // ボタンのテキストを切り替える
          action = action === 'join' ? 'leave' : 'join';
          joinLeaveBtn.textContent = action.charAt(0).toUpperCase() + action.slice(1);

          // ポップアップメッセージを表示
          const popup = document.createElement('div');
          popup.textContent = data.success;
          document.body.appendChild(popup);

          // 5秒後にポップアップを削除
          setTimeout(() => document.body.removeChild(popup), 5000);
        } else {
          alert(data.error);
        }
      });
    });
  }
});