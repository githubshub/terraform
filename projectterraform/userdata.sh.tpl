#!/bin/bash
dnf update -y
dnf install -y nginx
systemctl enable --now nginx

cat > /usr/share/nginx/html/index.html <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>${instance_name}</title>
  <style>
    body { font-family: Arial, sans-serif; margin: 0; background: #f4f6f8; color: #222; }
    body.dark { background: #1c1f26; color: #eee; }
    header { background: #623ce4; color: #fff; padding: 24px; text-align: center; }
    main { max-width: 700px; margin: 24px auto; padding: 0 16px; }
    .card { background: rgba(127,127,127,.15); border-radius: 10px; padding: 18px; margin-bottom: 16px; }
    button { background: #623ce4; color: #fff; border: 0; padding: 10px 16px; border-radius: 6px; cursor: pointer; margin: 4px; }
    input { padding: 9px; width: 60%; }
    li { cursor: pointer; margin: 6px 0; }
    li.done { text-decoration: line-through; opacity: .6; }
    #count { font-size: 40px; font-weight: bold; }
  </style>
</head>
<body>
  <header>
    <h1>Hello from Terraform + Nginx!</h1>
    <p>Server name: <b>${instance_name}</b> | Type: <b>${instance_type}</b></p>
  </header>
  <main>
    <div class="card">
      <button onclick="document.body.classList.toggle('dark')">Toggle dark mode</button>
    </div>
    <div class="card">
      <h3>Click counter</h3>
      <div id="count">0</div>
      <button onclick="change(1)">+1</button>
      <button onclick="change(-1)">-1</button>
      <button onclick="change(0)">Reset</button>
    </div>
    <div class="card">
      <h3>To-do list (click to complete)</h3>
      <input id="task" placeholder="e.g. terraform apply">
      <button onclick="addTask()">Add</button>
      <ul id="list"></ul>
    </div>
    <div class="card">
      <h3>Live clock</h3>
      <div id="clock"></div>
    </div>
  </main>
  <script>
    var n = 0;
    function change(d) { n = (d === 0) ? 0 : n + d; document.getElementById('count').textContent = n; }
    function addTask() {
      var inp = document.getElementById('task');
      if (!inp.value.trim()) return;
      var li = document.createElement('li');
      li.textContent = inp.value;
      li.onclick = function () { li.classList.toggle('done'); };
      document.getElementById('list').appendChild(li);
      inp.value = '';
    }
    setInterval(function () {
      document.getElementById('clock').textContent = new Date().toLocaleString();
    }, 1000);
  </script>
</body>
</html>
HTML

systemctl restart nginx