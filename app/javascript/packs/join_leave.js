document.addEventListener('DOMContentLoaded', function() {
  const joinLeaveBtn = document.querySelector('#join-leave-btn');
  if (!joinLeaveBtn) return;

  joinLeaveBtn.addEventListener('click', function(e) {
    const parkId = e.target.dataset.parkId;
    const action = e.target.textContent.toLowerCase();

    fetch(`/parks/${parkId}/${action}`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
      },
      body: JSON.stringify({ park_id: parkId }),
      credentials: 'same-origin'
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        // ボタンのテキストを切り替える
        joinLeaveBtn.textContent = action === 'join' ? 'Leave' : 'Join';

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
});