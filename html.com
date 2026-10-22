
<!DOCTYPE html>
<html lang="pt-BR">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>CLINICARE 360° | Qualidade na Saúde</title>
  <style>
    :root {
      --pink: #f3c5d5;
      --pink-dark: #d987a7;
      --lilac: #ded5f8;
      --blue: #d5e9fa;
      --green: #d9f0df;
      --cream: #fffaf7;
      --ink: #443847;
      --muted: #817583;
      --white: #ffffff;
      --shadow: 0 10px 30px #55405c12;
    }

    * { box-sizing: border-box; margin: 0; padding: 0; }

    html { scroll-behavior: smooth; }

    body {
      font-family: "Trebuchet MS", Arial, sans-serif;
      background: var(--cream);
      color: var(--ink);
      line-height: 1.6;
    }

    button, select { font: inherit; }

    button { cursor: pointer; }

    header {
      position: sticky;
      top: 0;
      z-index: 10;
      background: #fffaf7ed;
      backdrop-filter: blur(12px);
      border-bottom: 1px solid #f0e5eb;
    }

    nav {
      max-width: 1150px;
      margin: auto;
      padding: 15px 22px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 15px;
    }

    .logo {
      font-size: 1.15rem;
      font-weight: 900;
      letter-spacing: 1px;
      color: #b76689;
    }

    .logo span { color: var(--ink); }

    .nav-links {
      display: flex;
      flex-wrap: wrap;
      gap: 18px;
    }

    .nav-links a {
      text-decoration: none;
      color: var(--ink);
      font-size: .88rem;
      font-weight: 700;
    }

    .nav-links a:hover { color: var(--pink-dark); }

    .hero {
      max-width: 1150px;
      margin: auto;
      padding: 75px 22px 55px;
      display: grid;
      grid-template-columns: 1.2fr .8fr;
      gap: 35px;
      align-items: center;
    }

    .tag {
      display: inline-block;
      background: var(--pink);
      padding: 7px 14px;
      border-radius: 30px;
      font-size: .8rem;
      font-weight: 800;
      margin-bottom: 18px;
    }

    h1 {
      font-size: clamp(2.4rem, 5vw, 4.3rem);
      line-height: 1.08;
      letter-spacing: -2px;
      margin-bottom: 20px;
    }

    h1 span { color: #c66f96; }

    .hero p {
      max-width: 590px;
      color: var(--muted);
      font-size: 1.04rem;
      margin-bottom: 25px;
    }

    .button {
      border: 0;
      border-radius: 14px;
      padding: 12px 20px;
      background: #bd7393;
      color: white;
      font-weight: 800;
      transition: .2s;
      display: inline-block;
      text-decoration: none;
    }

    .button:hover { transform: translateY(-2px); filter: brightness(.97); }

    .button.secondary {
      background: white;
      color: var(--ink);
      border: 1px solid #eadde5;
    }

    .hero-art {
      min-height: 300px;
      border-radius: 35px;
      background: linear-gradient(145deg, var(--pink), var(--lilac), var(--blue));
      display: flex;
      align-items: center;
      justify-content: center;
      text-align: center;
      padding: 30px;
      box-shadow: var(--shadow);
      position: relative;
      overflow: hidden;
    }

    .hero-art::before, .hero-art::after {
      content: "";
      position: absolute;
      border-radius: 50%;
      background: #ffffff40;
    }

    .hero-art::before { width: 190px; height: 190px; top: -60px; right: -35px; }
    .hero-art::after { width: 120px; height: 120px; bottom: -35px; left: -20px; }

    .hero-icon { font-size: 5rem; position: relative; z-index: 1; }
    .hero-art h2 { position: relative; z-index: 1; font-size: 1.6rem; }
    .hero-art p { position: relative; z-index: 1; color: #55485c; margin: 5px auto 0; }

    .stats {
      max-width: 1100px;
      margin: 0 auto 50px;
      padding: 0 22px;
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 15px;
    }

    .stat {
      background: white;
      border: 1px solid #f0e5eb;
      border-radius: 18px;
      padding: 18px;
      text-align: center;
      box-shadow: var(--shadow);
    }

    .stat strong { display: block; font-size: 1.8rem; color: #bd7393; }
    .stat span { font-size: .86rem; color: var(--muted); }

    section {
      max-width: 1100px;
      padding: 55px 22px;
      margin: auto;
      scroll-margin-top: 75px;
    }

    .section-heading { margin-bottom: 28px; }

    .eyebrow {
      color: #bd7393;
      font-size: .78rem;
      font-weight: 900;
      text-transform: uppercase;
      letter-spacing: 2px;
    }

    h2.section-title {
      font-size: clamp(1.8rem, 4vw, 2.7rem);
      line-height: 1.2;
      margin: 7px 0 10px;
    }

    .section-heading p { color: var(--muted); max-width: 680px; }

    .cards {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 18px;
    }

    .card {
      background: white;
      padding: 24px;
      border-radius: 22px;
      border: 1px solid #f0e5eb;
      box-shadow: var(--shadow);
    }

    .card-icon { font-size: 2rem; margin-bottom: 10px; }
    .card h3 { margin-bottom: 8px; font-size: 1.08rem; }
    .card p { color: var(--muted); font-size: .94rem; }

    .soft-pink { background: #fff0f5; }
    .soft-blue { background: #edf6ff; }
    .soft-green { background: #eef9f0; }
    .soft-lilac { background: #f4f0ff; }

    .game-layout {
      display: grid;
      grid-template-columns: .8fr 1.2fr;
      gap: 22px;
      align-items: start;
    }

    .progress-card {
      background: white;
      border-radius: 22px;
      border: 1px solid #f0e5eb;
      padding: 24px;
      box-shadow: var(--shadow);
    }

    .progress-track {
      height: 11px;
      background: #f2e8ef;
      border-radius: 20px;
      overflow: hidden;
      margin: 12px 0 20px;
    }

    .progress-fill {
      height: 100%;
      width: 0;
      background: linear-gradient(90deg, #e8a8c1, #bca9ed);
      border-radius: 20px;
      transition: width .4s;
    }

    .phase {
      padding: 12px 0;
      border-bottom: 1px solid #f2e9ef;
      display: flex;
      gap: 12px;
      align-items: center;
    }

    .phase:last-child { border: 0; }
    .phase-number {
      width: 34px;
      height: 34px;
      flex-shrink: 0;
      display: grid;
      place-items: center;
      background: var(--lilac);
      border-radius: 50%;
      font-weight: 900;
    }

    .phase small { color: var(--muted); display: block; }

    .scenario {
      background: white;
      padding: 28px;
      border-radius: 24px;
      border: 1px solid #f0e5eb;
      box-shadow: var(--shadow);
    }

    .scenario h3 { font-size: 1.35rem; margin: 8px 0; }
    .scenario p { color: var(--muted); margin-bottom: 17px; }

    .choice-list { display: grid; gap: 10px; }

    .choice {
      border: 1px solid #eadde5;
      background: #fffafc;
      border-radius: 14px;
      text-align: left;
      padding: 14px;
      color: var(--ink);
      transition: .2s;
    }

    .choice:hover { border-color: #d987a7; transform: translateY(-1px); }
    .choice:disabled { cursor: default; opacity: .85; }

    .feedback {
      display: none;
      padding: 14px;
      border-radius: 14px;
      margin-top: 15px;
      font-weight: 700;
    }

    .feedback.show { display: block; }
    .feedback.good { background: #e7f7e9; color: #28643a; }
    .feedback.bad { background: #fff0f0; color: #8c4242; }

    .game-controls { margin-top: 15px; display: flex; gap: 10px; flex-wrap: wrap; }

    .lab {
      background: linear-gradient(135deg, #f4efff, #fff0f5);
      border-radius: 28px;
      padding: 28px;
    }

    .lab-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 22px;
    }

    label { font-weight: 800; display: block; margin: 12px 0 6px; }

    select {
      width: 100%;
      padding: 13px;
      border-radius: 12px;
      border: 1px solid #e5d8e2;
      background: white;
      color: var(--ink);
    }

    .plan-result {
      background: white;
      border-radius: 18px;
      padding: 22px;
      min-height: 180px;
    }

    .plan-result ul { padding-left: 20px; margin-top: 10px; }
    .plan-result li { margin: 7px 0; }

    .pdca {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      gap: 12px;
      margin-top: 22px;
    }

    .pdca div {
      padding: 17px;
      border-radius: 16px;
      background: white;
      text-align: center;
    }

    .pdca strong { display: block; font-size: 1.35rem; color: #bd7393; }

    .quiz-box {
      background: white;
      border: 1px solid #f0e5eb;
      border-radius: 24px;
      padding: 28px;
      box-shadow: var(--shadow);
    }

    .quiz-top {
      display: flex;
      justify-content: space-between;
      gap: 10px;
      flex-wrap: wrap;
      color: var(--muted);
      font-weight: 800;
      margin-bottom: 15px;
    }

    .quiz-question { font-size: 1.3rem; margin-bottom: 18px; }

    .quiz-options { display: grid; gap: 10px; }

    .quiz-option {
      border: 1px solid #eadde5;
      background: #fffafc;
      padding: 13px;
      text-align: left;
      border-radius: 13px;
      color: var(--ink);
    }

    .quiz-option:hover { border-color: #bd7393; }
    .quiz-option:disabled { cursor: default; }
    .quiz-option.correct { background: #e7f7e9; border-color: #9bceaa; }
    .quiz-option.incorrect { background: #fff0f0; border-color: #e6aaaa; }

    .achievements {
      display: grid;
      grid-template-columns: repeat(3, 1fr);
      gap: 15px;
    }

    .achievement {
      background: white;
      border: 1px solid #f0e5eb;
      border-radius: 18px;
      padding: 20px;
      text-align: center;
      opacity: .5;
      filter: grayscale(1);
    }

    .achievement.unlocked { opacity: 1; filter: none; background: #fff7fb; }
    .achievement span { font-size: 2rem; display: block; margin-bottom: 7px; }
    .achievement p { color: var(--muted); font-size: .85rem; }

    .quote {
      margin-top: 22px;
      background: var(--green);
      padding: 25px;
      border-radius: 22px;
      text-align: center;
      font-size: 1.1rem;
      font-weight: 800;
    }

    footer {
      margin-top: 35px;
      padding: 35px 22px;
      background: #f3eaf0;
      text-align: center;
      color: var(--muted);
    }

    footer strong { color: var(--ink); }
    .footer-logo { color: #bd7393; font-weight: 900; font-size: 1.2rem; margin-bottom: 7px; }

    @media (max-width: 800px) {
      .hero, .game-layout, .lab-grid { grid-template-columns: 1fr; }
      .hero { padding-top: 45px; }
      .hero-art { min-height: 230px; }
      .cards { grid-template-columns: 1fr 1fr; }
      .nav-links { gap: 10px; justify-content: flex-end; }
      .nav-links a { font-size: .78rem; }
    }

    @media (max-width: 520px) {
      nav { align-items: flex-start; flex-direction: column; }
      .nav-links { justify-content: flex-start; }
      .cards, .stats, .achievements { grid-template-columns: 1fr; }
      .pdca { grid-template-columns: 1fr 1fr; }
      h1 { letter-spacing: -1px; }
      section { padding-top: 38px; padding-bottom: 38px; }
      .scenario, .quiz-box, .lab { padding: 20px; }
    }
  </style>
</head>
<body>

<header>
  <nav>
    <div class="logo">CLINICARE <span>360°</span></div>
    <div class="nav-links">
      <a href="#inicio">Início</a>
      <a href="#qualidade">Qualidade</a>
      <a href="#desafios">Desafios</a>
      <a href="#laboratorio">Melhoria</a>
      <a href="#quiz">Quiz</a>
    </div>
  </nav>
</header>

<main>
  <div class="hero" id="inicio">
    <div>
      <span class="tag">💗 MISSÃO: ATENDER MELHOR</span>
      <h1>Qualidade no atendimento começa com <span>cuidado.</span></h1>
      <p>
        Bem-vindo ao CLINICARE 360°, uma experiência interativa sobre
        qualidade no atendimento e melhoria contínua na recepção da saúde.
        Aprenda, enfrente situações e descubra como pequenas atitudes
        podem transformar a experiência de um paciente.
      </p>
      <a class="button" href="#desafios">Começar a missão ✨</a>
      <a class="button secondary" href="#qualidade">Explorar o conteúdo</a>
    </div>

    <div class="hero-art">
      <div>
        <div class="hero-icon">🏥💗</div>
        <h2>Seu atendimento faz a diferença!</h2>
        <p>Humanização, organização e melhoria todos os dias.</p>
      </div>
    </div>
  </div>

  <div class="stats">
    <div class="stat">
      <strong id="points">0</strong>
      <span>pontos conquistados</span>
    </div>
    <div class="stat">
      <strong id="completed">0/4</strong>
      <span>etapas concluídas</span>
    </div>
    <div class="stat">
      <strong id="badges-count">0/3</strong>
      <span>conquistas desbloqueadas</span>
    </div>
  </div>

  <section id="qualidade">
    <div class="section-heading">
      <span class="eyebrow">01 · Entenda o conceito</span>
      <h2 class="section-title">O que é qualidade no atendimento?</h2>
      <p>
        É oferecer um atendimento eficiente, respeitoso, seguro e humanizado,
        considerando as necessidades de cada paciente.
      </p>
    </div>

    <div class="cards">
      <article class="card soft-pink">
        <div class="card-icon">💬</div>
        <h3>Comunicação clara</h3>
        <p>Explicar informações com educação, ouvir com atenção e evitar confusões.</p>
      </article>
      <article class="card soft-blue">
        <div class="card-icon">🤝</div>
        <h3>Humanização</h3>
        <p>Tratar cada pessoa com empatia, respeito, paciência e sem julgamentos.</p>
      </article>
      <article class="card soft-green">
        <div class="card-icon">🛡️</div>
        <h3>Segurança e privacidade</h3>
        <p>Proteger os dados dos pacientes e seguir os cuidados de biossegurança.</p>
      </article>
      <article class="card soft-lilac">
        <div class="card-icon">⏰</div>
        <h3>Organização</h3>
        <p>Organizar filas, horários, documentos e informações para reduzir falhas.</p>
      </article>
      <article class="card soft-blue">
        <div class="card-icon">📈</div>
        <h3>Melhoria contínua</h3>
        <p>Identificar problemas, testar soluções e avaliar se os resultados melhoraram.</p>
      </article>
      <article class="card soft-pink">
        <div class="card-icon">🌷</div>
        <h3>Acolhimento</h3>
        <p>Receber o paciente com cordialidade e demonstrar que ele está sendo ouvido.</p>
      </article>
    </div>

    <div class="quote">
      “Um bom atendimento não é apenas resolver um problema, mas fazer a pessoa se sentir respeitada durante todo o processo.”
    </div>
  </section>

  <section id="desafios">
    <div class="section-heading">
      <span class="eyebrow">02 · Aprenda na prática</span>
      <h2 class="section-title">SOS Recepção 🚨</h2>
      <p>
        Você está no comando da recepção. Leia a situação e escolha a melhor
        atitude para resolver o problema.
      </p>
    </div>

    <div class="game-layout">
      <aside class="progress-card">
        <h3>🏆 Sua jornada</h3>
        <p style="color:var(--muted);font-size:.9rem">Complete as quatro etapas para se tornar um agente da qualidade.</p>
        <div class="progress-track">
          <div class="progress-fill" id="progress-fill"></div>
        </div>
        <p><strong id="progress-label">0% concluído</strong></p>

        <div class="phase">
          <div class="phase-number" id="phase-1">1</div>
          <div><strong>Atendimento</strong><small>Escolha a melhor atitude</small></div>
        </div>
        <div class="phase">
          <div class="phase-number" id="phase-2">2</div>
          <div><strong>Solução de problemas</strong><small>Resolva situações reais</small></div>
        </div>
        <div class="phase">
          <div class="phase-number" id="phase-3">3</div>
          <div><strong>Plano de melhoria</strong><small>Crie uma solução</small></div>
        </div>
        <div class="phase">
          <div class="phase-number" id="phase-4">4</div>
          <div><strong>Teste final</strong><small>Responda ao quiz</small></div>
        </div>
      </aside>

      <div class="scenario">
        <span class="tag" id="scenario-count">DESAFIO 1 DE 3</span>
        <h3 id="scenario-title">Paciente insatisfeito</h3>
        <p id="scenario-text">
          Um paciente está esperando há muito tempo e começa a reclamar.
          Qual é a melhor atitude da recepcionista?
        </p>
        <div class="choice-list" id="choices"></div>
        <div class="feedback" id="scenario-feedback" role="status"></div>
        <div class="game-controls">
          <button class="button" id="next-scenario" onclick="nextScenario()" hidden>Próximo desafio →</button>
          <button class="button secondary" onclick="resetScenarios()">Recomeçar desafios</button>
        </div>
      </div>
    </div>
  </section>

  <section id="laboratorio">
    <div class="section-heading">
      <span class="eyebrow">03 · Coloque em prática</span>
      <h2 class="section-title">Laboratório de melhoria 💡</h2>
      <p>
        Todo problema pode ser o começo de uma melhoria. Escolha uma situação
        e monte um plano de ação para a recepção.
      </p>
    </div>

    <div class="lab">
      <div class="lab-grid">
        <div>
          <h3>🔎 Qual problema vamos resolver?</h3>
          <label for="problem">Selecione uma situação:</label>
          <select id="problem">
            <option value="fila">Fila muito demorada</option>
            <option value="agenda">Erros nos agendamentos</option>
            <option value="informacao">Informações confusas</option>
            <option value="privacidade">Falta de privacidade</option>
          </select>

          <label for="priority">Prioridade da equipe:</label>
          <select id="priority">
            <option value="imediata">Resolver o quanto antes</option>
            <option value="planejada">Planejar e acompanhar</option>
            <option value="equipe">Treinar a equipe</option>
          </select>

          <button class="button" style="margin-top:18px" onclick="generatePlan()">
            Criar plano de ação ✨
          </button>
        </div>

        <div class="plan-result" id="plan-result" aria-live="polite">
          <h3>📋 Seu plano aparecerá aqui</h3>
          <p style="color:var(--muted);margin-top:8px">
            Escolha um problema e clique em “Criar plano de ação”.
          </p>
        </div>
      </div>

      <h3 style="margin-top:28px">🔄 Ciclo PDCA: melhorar continuamente</h3>
      <div class="pdca">
        <div><strong>P</strong><b>Planejar</b><p style="font-size:.85rem">Identificar o problema e definir a meta.</p></div>
        <div><strong>D</strong><b>Executar</b><p style="font-size:.85rem">Colocar a solução em prática.</p></div>
        <div><strong>C</strong><b>Checar</b><p style="font-size:.85rem">Verificar se funcionou.</p></div>
        <div><strong>A</strong><b>Agir</b><p style="font-size:.85rem">Corrigir falhas e padronizar melhorias.</p></div>
      </div>
    </div>
  </section>

  <section id="quiz">
    <div class="section-heading">
      <span class="eyebrow">04 · Teste seus conhecimentos</span>
      <h2 class="section-title">Quiz da qualidade 🧠</h2>
      <p>Responda às perguntas e descubra quantos pontos consegue conquistar!</p>
    </div>

    <div class="quiz-box">
      <div class="quiz-top">
        <span id="quiz-counter">Pergunta 1 de 5</span>
        <span id="quiz-score">Acertos: 0</span>
      </div>
      <div class="progress-track">
        <div class="progress-fill" id="quiz-progress"></div>
      </div>
      <h3 class="quiz-question" id="quiz-question"></h3>
      <div class="quiz-options" id="quiz-options"></div>
      <div class="feedback" id="quiz-feedback" role="status"></div>
      <div class="game-controls">
        <button class="button" id="quiz-next" onclick="nextQuestion()" hidden>Próxima pergunta →</button>
        <button class="button secondary" id="quiz-restart" onclick="startQuiz()" hidden>Refazer quiz ↻</button>
      </div>
    </div>
  </section>

  <section id="conquistas">
    <div class="section-heading">
      <span class="eyebrow">Suas recompensas</span>
      <h2 class="section-title">Conquistas desbloqueáveis 🏅</h2>
      <p>As conquistas são liberadas conforme você avança nas atividades do site.</p>
    </div>

    <div class="achievements">
      <div class="achievement" id="badge-attendance">
        <span>💗</span>
        <h3>Atendimento de ouro</h3>
        <p>Conclua o primeiro desafio.</p>
      </div>
      <div class="achievement" id="badge-improvement">
        <span>💡</span>
        <h3>Agente da melhoria</h3>
        <p>Crie seu primeiro plano de ação.</p>
      </div>
      <div class="achievement" id="badge-quiz">
        <span>🏆</span>
        <h3>Mestre da qualidade</h3>
        <p>Conclua o quiz final.</p>
      </div>
    </div>
  </section>
</main>

<footer>
  <div class="footer-logo">CLINICARE 360° 💗</div>
  <p><strong>Qualidade no atendimento e melhoria contínua na recepção da saúde.</strong></p>
  <p>Pequenas atitudes, grandes melhorias.</p>
  <p style="margin-top:12px;font-size:.8rem">Projeto educativo • Atendimento humanizado • Segurança • Qualidade</p>
</footer>

<script>
  let points = 0;
  let completed = [false, false, false, false];
  let scenarioIndex = 0;
  let scenarioAnswered = false;
  let planCreated = false;
  let quizFinished = false;

  const scenarios = [
    {
      title: "Paciente insatisfeito",
      text: "Um paciente está esperando há muito tempo e começa a reclamar. Qual é a melhor atitude da recepcionista?",
      choices: [
        "Ignorar a reclamação e continuar trabalhando.",
        "Ouvir com atenção, demonstrar empatia e explicar a situação com clareza.",
        "Responder de forma grosseira para encerrar a conversa."
      ],
      correct: 1,
      good: "Muito bem! Ouvir, acolher e informar com clareza ajuda a reduzir conflitos e melhora a experiência do paciente.",
      bad: "Essa atitude pode aumentar a insatisfação. O ideal é ouvir o paciente, agir com respeito e explicar a situação."
    },
    {
      title: "Informação confidencial",
      text: "Uma pessoa pede informações sobre o atendimento de outro paciente. O que você deve fazer?",
      choices: [
        "Contar tudo, porque a pessoa parece ser conhecida.",
        "Falar as informações em voz alta para agilizar a fila.",
        "Proteger os dados e seguir as regras de confidencialidade e autorização."
      ],
      correct: 2,
      good: "Correto! Informações de saúde são privadas. A equipe deve respeitar a confidencialidade e as regras de acesso.",
      bad: "Informações de saúde não devem ser compartilhadas livremente. É necessário proteger a privacidade do paciente."
    },
    {
      title: "Falha no agendamento",
      text: "Você percebe que um horário foi marcado incorretamente. Qual é a melhor ação?",
      choices: [
        "Verificar o erro, corrigir conforme o procedimento e informar as pessoas envolvidas.",
        "Fingir que nada aconteceu.",
        "Culpar outro funcionário na frente do paciente."
      ],
      correct: 0,
      good: "Excelente! Identificar, corrigir e prevenir erros é parte da melhoria contínua.",
      bad: "Esconder ou transferir a culpa não resolve o problema. Corrigir a falha e evitar que se repita é o caminho."
    }
  ];

  function updateDashboard() {
    document.getElementById("points").textContent = points;
    const done = completed.filter(Boolean).length;
    document.getElementById("completed").textContent = done + "/4";
    document.getElementById("progress-fill").style.width = (done / 4 * 100) + "%";
    document.getElementById("progress-label").textContent = Math.round(done / 4 * 100) + "% concluído";

    completed.forEach((isDone, i) => {
      const el = document.getElementById("phase-" + (i + 1));
      el.textContent = isDone ? "✓" : i + 1;
      el.style.background = isDone ? "#d9f0df" : "#ded5f8";
    });

    updateBadges();
  }

  function updateBadges() {
    const badges = [
      ["badge-attendance", completed[0]],
      ["badge-improvement", planCreated],
      ["badge-quiz", quizFinished]
    ];

    let unlocked = 0;
    badges.forEach(([id, yes]) => {
      document.getElementById(id).classList.toggle("unlocked", yes);
      if (yes) unlocked++;
    });

    document.getElementById("badges-count").textContent = unlocked + "/3";
  }

  function renderScenario() {
    const s = scenarios[scenarioIndex];
    scenarioAnswered = false;
    document.getElementById("scenario-count").textContent =
      "DESAFIO " + (scenarioIndex + 1) + " DE " + scenarios.length;
    document.getElementById("scenario-title").textContent = s.title;
    document.getElementById("scenario-text").textContent = s.text;
    document.getElementById("scenario-feedback").className = "feedback";
    document.getElementById("next-scenario").hidden = true;

    const choices = document.getElementById("choices");
    choices.innerHTML = "";

    s.choices.forEach((choice, i) => {
      const button = document.createElement("button");
      button.className = "choice";
      button.textContent = ["A) ", "B) ", "C) "][i] + choice;
      button.onclick = () => answerScenario(i);
      choices.appendChild(button);
    });
  }

  function answerScenario(index) {
    if (scenarioAnswered) return;
    scenarioAnswered = true;

    const s = scenarios[scenarioIndex];
    const isCorrect = index === s.correct;
    const feedback = document.getElementById("scenario-feedback");
    feedback.className = "feedback show " + (isCorrect ? "good" : "bad");
    feedback.textContent = (isCorrect ? "✅ " : "💭 ") + (isCorrect ? s.good : s.bad);

    document.querySelectorAll("#choices button").forEach((button, i) => {
      button.disabled = true;
      if (i === s.correct) button.style.borderColor = "#81bd91";
    });

    if (isCorrect) points += 10;

    if (scenarioIndex === 0) {
      completed[0] = true;
      updateDashboard();
    }

    document.getElementById("next-scenario").hidden = false;
    document.getElementById("next-scenario").textContent =
      scenarioIndex === scenarios.length - 1 ? "Concluir desafios ✓" : "Próximo desafio →";

    updateDashboard();
  }

  function nextScenario() {
    if (scenarioIndex < scenarios.length - 1) {
      scenarioIndex++;
      renderScenario();
    } else {
      completed[1] = true;
      updateDashboard();
      document.getElementById("scenario-title").textContent = "Desafios concluídos! 🎉";
      document.getElementById("scenario-text").textContent =
        "Você terminou os desafios da recepção. Cada decisão pode contribuir para um atendimento mais seguro e humanizado.";
      document.getElementById("choices").innerHTML = "";
      document.getElementById("scenario-feedback").className = "feedback show good";
      document.getElementById("scenario-feedback").textContent =
        "Parabéns! Continue no Laboratório de Melhoria para criar um plano de ação.";
      document.getElementById("next-scenario").hidden = true;
    }
  }

  function resetScenarios() {
    scenarioIndex = 0;
    completed[0] = false;
    completed[1] = false;
    updateDashboard();
    renderScenario();
  }

  const plans = {
    fila: {
      title: "⏰ Plano: reduzir o tempo de espera",
      steps: [
        "Observar em quais horários a fila fica maior.",
        "Organizar o fluxo de atendimento e as prioridades conforme os protocolos.",
        "Orientar os pacientes sobre a ordem e os possíveis tempos de espera.",
        "Acompanhar o tempo de espera para verificar se houve melhora."
      ],
      measure: "Indicador: tempo médio de espera."
    },
    agenda: {
      title: "📅 Plano: evitar erros nos agendamentos",
      steps: [
        "Conferir os dados necessários antes de confirmar o horário.",
        "Utilizar uma rotina padronizada para registrar os agendamentos.",
        "Confirmar as informações com o paciente de forma clara.",
        "Revisar os erros encontrados e ajustar o processo."
      ],
      measure: "Indicador: quantidade de erros de agendamento."
    },
    informacao: {
      title: "💬 Plano: melhorar a comunicação",
      steps: [
        "Identificar quais orientações causam dúvidas frequentes.",
        "Criar orientações simples, claras e padronizadas.",
        "Treinar a equipe para transmitir as informações com educação.",
        "Pedir retorno dos pacientes para avaliar a compreensão."
      ],
      measure: "Indicador: quantidade de dúvidas e reclamações."
    },
    privacidade: {
      title: "🛡️ Plano: proteger a privacidade",
      steps: [
        "Identificar situações em que informações podem ser ouvidas por terceiros.",
        "Evitar falar dados pessoais em voz alta ou em locais inadequados.",
        "Orientar a equipe sobre confidencialidade e proteção de dados.",
        "Verificar se os procedimentos de privacidade estão sendo seguidos."
      ],
      measure: "Indicador: falhas identificadas nos procedimentos de privacidade."
    }
  };

  function generatePlan() {
    const problem = document.getElementById("problem").value;
    const priority = document.getElementById("priority").value;
    const plan = plans[problem];

    const priorityText = {
      imediata: "Prioridade: tratar a falha com rapidez, seguindo os protocolos da instituição.",
      planejada: "Prioridade: definir responsáveis, prazos e acompanhar os resultados.",
      equipe: "Prioridade: orientar e treinar a equipe para padronizar o atendimento."
    };

    const result = document.getElementById("plan-result");
    result.innerHTML = "<h3>" + plan.title + "</h3><ul>" +
      plan.steps.map(step => "<li>" + step + "</li>").join("") +
      "</ul><p style='margin-top:14px'><strong>" + plan.measure + "</strong></p>" +
      "<p style='margin-top:8px;color:#817583'>" + priorityText[priority] + "</p>";

    if (!planCreated) {
      points += 10;
      planCreated = true;
    }

    completed[2] = true;
    updateDashboard();
  }

  const questions = [
    {
      q: "1. O que significa atendimento humanizado?",
      options: [
        "Atender rapidamente sem ouvir o paciente.",
        "Tratar as pessoas com empatia, respeito e atenção.",
        "Dar prioridade apenas a quem reclama."
      ],
      correct: 1,
      explanation: "Humanização significa acolher e respeitar as necessidades de cada pessoa."
    },
    {
      q: "2. Qual é o objetivo da melhoria contínua?",
      options: [
        "Identificar problemas e aperfeiçoar os processos constantemente.",
        "Fazer tudo sempre do mesmo jeito, mesmo quando não funciona.",
        "Evitar que a equipe avalie os resultados."
      ],
      correct: 0,
      explanation: "A melhoria contínua busca avaliar os processos e torná-los cada vez melhores."
    },
    {
      q: "3. Para que serve o ciclo PDCA?",
      options: [
        "Para aumentar a quantidade de documentos.",
        "Para substituir a comunicação com os pacientes.",
        "Para planejar, executar, checar e agir para melhorar."
      ],
      correct: 2,
      explanation: "PDCA é um método de gestão que ajuda a organizar e avaliar melhorias."
    },
    {
      q: "4. Como a recepção deve lidar com dados dos pacientes?",
      options: [
        "Compartilhar com qualquer pessoa que perguntar.",
        "Proteger as informações e respeitar a confidencialidade.",
        "Deixar documentos pessoais expostos no balcão."
      ],
      correct: 1,
      explanation: "A privacidade é essencial para a segurança e a confiança no atendimento."
    },
    {
      q: "5. O que fazer ao perceber um erro no agendamento?",
      options: [
        "Ignorar para não perder tempo.",
        "Culpar um colega sem verificar o ocorrido.",
        "Verificar, corrigir conforme o procedimento e prevenir novas falhas."
      ],
      correct: 2,
      explanation: "Corrigir e aprender com os erros ajuda a evitar que eles se repitam."
    }
  ];

  let questionIndex = 0;
  let quizCorrect = 0;
  let questionAnswered = false;

  function startQuiz() {
    questionIndex = 0;
    quizCorrect = 0;
    quizFinished = false;
    completed[3] = false;
    document.getElementById("quiz-restart").hidden = true;
    updateDashboard();
    renderQuestion();
  }

  function renderQuestion() {
    questionAnswered = false;
    const q = questions[questionIndex];

    document.getElementById("quiz-counter").textContent =
      "Pergunta " + (questionIndex + 1) + " de " + questions.length;
    document.getElementById("quiz-score").textContent = "Acertos: " + quizCorrect;
    document.getElementById("quiz-question").textContent = q.q;
    document.getElementById("quiz-progress").style.width =
      (questionIndex / questions.length * 100) + "%";
    document.getElementById("quiz-feedback").className = "feedback";
    document.getElementById("quiz-next").hidden = true;

    const options = document.getElementById("quiz-options");
    options.innerHTML = "";

    q.options.forEach((option, i) => {
      const button = document.createElement("button");
      button.className = "quiz-option";
      button.textContent = option;
      button.onclick = () => answerQuestion(i);
      options.appendChild(button);
    });
  }

  function answerQuestion(index) {
    if (questionAnswered) return;
    questionAnswered = true;

    const q = questions[questionIndex];
    const isCorrect = index === q.correct;
    const feedback = document.getElementById("quiz-feedback");

    if (isCorrect) {
      quizCorrect++;
      points += 10;
    }

    document.querySelectorAll(".quiz-option").forEach((button, i) => {
      button.disabled = true;
      if (i === q.correct) button.classList.add("correct");
      else if (i === index) button.classList.add("incorrect");
    });

    feedback.className = "feedback show " + (isCorrect ? "good" : "bad");
    feedback.textContent = (isCorrect ? "✅ Correto! " : "💭 Não foi dessa vez. ") + q.explanation;

    document.getElementById("quiz-score").textContent = "Acertos: " + quizCorrect;
    document.getElementById("quiz-progress").style.width =
      ((questionIndex + 1) / questions.length * 100) + "%";

    if (questionIndex === questions.length - 1) {
      document.getElementById("quiz-next").hidden = true;
      document.getElementById("quiz-restart").hidden = false;
      feedback.textContent += " Resultado final: " + quizCorrect + " de " + questions.length + " acertos.";
      quizFinished = true;
      completed[3] = true;
      updateDashboard();
    } else {
      document.getElementById("quiz-next").hidden = false;
    }

    updateDashboard();
  }

  function nextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      renderQuestion();
    }
  }

  renderScenario();
  startQuiz();
</script>

</body>
</html>
