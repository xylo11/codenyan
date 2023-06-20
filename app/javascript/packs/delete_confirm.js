document.addEventListener('DOMContentLoaded', function() {
  const deleteBtn = document.querySelector('#delete-park-btn');
  if (!deleteBtn) return;

  deleteBtn.addEventListener('click', function(e) {
    const isConfirmed = confirm('パーク名を削除しますがよろしいですか。よろしければ削除ボタンを押してください');
    if (isConfirmed) {
      const parkId = e.target.dataset.parkId;
      fetch(`/parks/${parkId}`, { method: 'DELETE' })
        .then(res => {
          if (res.ok) window.location.href = '/';
        });
    }
  });
});