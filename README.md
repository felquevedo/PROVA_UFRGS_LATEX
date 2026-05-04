# 📘 ufrgsprova

Classe LaTeX para elaboração de provas acadêmicas com layout institucional.

Desenvolvida para organizar de forma padronizada:

- Cabeçalho institucional
- Instruções da prova
- Identificação do aluno
- Questões com pontuação
- Figuras com legenda e numeração automática
- Layout em colunas (opcional)

---

## 🚀 Funcionalidades

- ✔ Inserção automática de questões a partir de arquivos externos  
- ✔ Inserção de figuras (pdf, png, jpeg) com legenda automaticamente numerada  
- ✔ Referência automática de figuras no enunciado  
- ✔ Organização das questões por pastas (`prova01/`, `recuperacao/`, etc)  
- ✔ Suporte a colunas (duas colunas, duas colunas sendo uma em branco)
- ✔ Layout limpo e otimizado para impressão  

---

## 📁 Estrutura recomendada

```
prova/
│
├── prova01.tex
├── ufrgsprova.cls
├── README.md
├── .gitignore
│
├── prova01/
    ├── q01.tex
    ├── q01.png
    ├── q02.tex
    ├── q02.pdf

```

---

## ⚙️ Configuração inicial

No arquivo principal (`prova01.tex`):

```latex
\documentclass{ufrgsprova}

\disciplina     {ENG01156 - Mecânica}
\professor      {Prof. Nome}
\tituloProva    {Avaliação 01}
\logo           {ufrgs.png}
\pastaquestoes	{prova01}
```
---

## 🧾 Cabeçalho

```latex
\cabecalhoProva
```

---

## 📋 Instruções

```latex
\instrucoes{instrucoes.tex}
```

Ou com tamanho reduzido:

```latex
\instrucoes[\footnotesize]{instrucoes.tex}
```

---

## 🧑‍🎓 Identificação

```latex
\identificacao
```

---

## ❓ Questões

```latex
\questao{2,0}{q01}{1}
```

---

## 🖼️ Figuras

```latex
\figuradaquestao{0.55\linewidth}{q01}{Diagrama do sistema}
```

---

## 🔗 Referenciar figura no enunciado

Dentro do arquivo da questão:

```latex
Considere o sistema mostrado na \figuraquestao.
```

---

## 🧩 Duas colunas

```latex
\iniciaduascolunas
...
\finalizaduascolunas
```

---

## 📄 Uma coluna (outra em branco)

```latex
\iniciaumacoluna
...
\finalizaumacoluna
```

---

## 📌 Boas práticas

- Compile o documento **duas vezes** para atualizar referências
- Use `\linewidth` para figuras em colunas
- Mantenha nomes consistentes entre arquivos

---

## 🛠️ Requisitos

- LaTeX (TeX Live, MikTeX ou Overleaf)
- Pacotes: graphicx, xparse, multicol, paracol, array

---

## 📜 Licença

Uso acadêmico livre.

---

## 👨‍🏫 Autor

Prof. Felipe Quevedo  
Engenharia Civil — UFRGS
