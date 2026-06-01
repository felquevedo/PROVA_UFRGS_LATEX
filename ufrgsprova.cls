%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLASSE: ufrgsprova.cls
%
% MANUAL BÁSICO DE USO
%
% Esta classe foi criada para geração de provas com:
%  - Cabeçalho institucional
%  - Instruções
%  - Identificação do aluno
%  - Questões com pontuação
%  - Figuras com legenda automática
%  - Suporte a colunas
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ufrgsprova}[2026/04/29 Classe para provas UFRGS]

\LoadClass[12pt,a4paper]{article}

% Pacotes
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[brazil]{babel}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{xparse}
\RequirePackage{multicol}
\RequirePackage{needspace}
\RequirePackage{paracol}

% Margens
\geometry{
  top=1.5cm,
  bottom=1.5cm,
  left=1.0cm,
  right=1.0cm
}

% Variáveis
\newcommand{\universidade}{Universidade Federal do Rio Grande do Sul - UFRGS}
\newcommand{\escola}{Escola de Engenharia - Departamento de Engenharia Civil (DECIV)}
\newcommand{\disciplina}[1]{\renewcommand{\@disciplina}{#1}}
\newcommand{\@disciplina}{Disciplina}
\newcommand{\tituloProva}[1]{\renewcommand{\@tituloProva}{#1}}
\newcommand{\@tituloProva}{Avaliação}
\newcommand{\professor}[1]{\renewcommand{\@professor}{#1}}
\newcommand{\@professor}{Professor}
\newcommand{\logo}[1]{\renewcommand{\@logo}{#1}}
\newcommand{\@logo}{logo.png}
\newcommand{\pastaquestoes}[1]{\renewcommand{\@pastaquestoes}{#1}}
\newcommand{\@pastaquestoes}{questoes}

%
% Início de duas colunas
\newcommand{\iniciaduascolunas}{\setlength{\columnsep}{0.8cm} \setlength{\columnseprule}{0.4pt} \begin{multicols}{2}\raggedcolumns}
% Fim de duas colunas
\newcommand{\finalizaduascolunas}{\end{multicols}}


% Início
% Questões apenas na coluna da esquerda
% Coluna direita fica em branco em todas as páginas

\newcommand{\iniciaumacoluna}{%
	\setlength{\columnsep}{0.8cm}
	\setlength{\columnseprule}{0.4pt}
	\begin{paracol}{2}
	}
	
	\newcommand{\finalizaumacoluna}{%
	\end{paracol}
}

% Cabeçalho
\RequirePackage{array}

\newcommand{\cabecalhoProva}{%
	
	\noindent
	\begin{tabular}{@{}m{3.2cm} m{\dimexpr\textwidth-3.2cm\relax}@{}}
		
		\centering
		\includegraphics[width=2.6cm]{\@logo}
		
		&
		
		\raggedright
		\textbf{\universidade}\\
		\escola\\
		Disciplina: \@disciplina\\
		Prof. \@professor
		
	\end{tabular}
	
	\vspace{0.3cm}
	\hrule
	\vspace{0.25cm}
	
	\begin{center}
		\textbf{\@tituloProva}
	\end{center}
	
	\vspace{0.15cm}
	\hrule
	\vspace{0.4cm}
	
}

% Rodapé
\pagestyle{fancy}
\fancyhf{}
\fancyfoot[L]{\@disciplina}
\fancyfoot[C]{\thepage}
\fancyfoot[R]{UFRGS - DECIV}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0.4pt}

% Instruções externas
\NewDocumentCommand{\instrucoes}{O{\normalsize} m}{
	\noindent\textbf{Instruções:}

	{#1
	\input{#2}
	}

	\vspace{0.3cm}
	\hrule
	\vspace{0.4cm}
}

% Formulário
\NewDocumentCommand{\formulario}{m m}{
	
	\centering{\noindent\textbf{FORMULÁRIO}}
	
	\begin{center}
	
	
	\IfFileExists{\@pastaquestoes/#2.pdf}{%
		\includegraphics[width=#1]{\@pastaquestoes/#2.pdf}%
	}{%
		\IfFileExists{\@pastaquestoes/#2.png}{%
			\includegraphics[width=#1]{\@pastaquestoes/#2.png}%
		}{%
			\IfFileExists{\@pastaquestoes/#2.jpg}{%
				\includegraphics[width=#1]{\@pastaquestoes/#2.jpg}%
			}{%
				\IfFileExists{\@pastaquestoes/#2.jpeg}{%
					\includegraphics[width=#1]{\@pastaquestoes/#2.jpeg}%
				}{%
					\textit{Figura não encontrada: \@pastaquestoes/#2}%
	}}}}
	\end{center}
	
}

% Identificação
\newcommand{\identificacao}{
	\vspace{0.4cm}	
	\noindent
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}
			p{0.6\textwidth}
			p{0.2\textwidth}
			p{0.2\textwidth}}
		
		\textbf{Nome:} \rule{0.85\linewidth}{0.1pt}
		&
		\textbf{Cartão:} \rule{0.5\linewidth}{0.1pt}
		&
		\textbf{Data:} \rule{0.45\linewidth}{0.1pt}
		
	\end{tabular*}
	
	\vspace{0.6cm}
	
}

% Contadores
\newcounter{questao}
\newcounter{figuraquestao}

% Comando vazio padrão
\newcommand{\figuraquestao}{}

% ----------------------------
% QUESTÃO
% ----------------------------
% #1 = pontuação
% #2 = caminho do arquivo da questão, sem extensão
% #3 = número da figura relacionada
%
% Exemplo:
% \questao{2,0}{questoes/q01}{1}

\NewDocumentCommand{\questao}{m m m}{%
	
	\stepcounter{questao}
	
	\vspace{0.4cm}
	
	\if\relax\detokenize{#3}\relax
	\gdef\figuraquestao{}%
	\else
	\gdef\figuraquestao{Figura~\ref{fig:#3}}%
	\fi
	
	\noindent
	\textbf{Questão \thequestao} \textbf{(#1 pontos)} \input{\@pastaquestoes/#2.tex}
	
	\vspace{0.2cm}
}

% ----------------------------
% FIGURA DA QUESTÃO
% ----------------------------
% #1 = tamanho
% #2 = caminho da figura, sem extensão
% #3 = legenda
%
% Exemplo:
% \figuradaquestao{0.55\textwidth}{figuras/q01}{Sistema de forças.}

\NewDocumentCommand{\figuradaquestao}{m m m}{%
	
	\refstepcounter{figuraquestao}
	\label{fig:\thefiguraquestao}
	
	\vspace{0.2cm}
	
	\begin{center}
		
		
		\IfFileExists{\@pastaquestoes/#2.pdf}{%
			\includegraphics[width=#1]{\@pastaquestoes/#2.pdf}%
		}{%
			\IfFileExists{\@pastaquestoes/#2.png}{%
				\includegraphics[width=#1]{\@pastaquestoes/#2.png}%
			}{%
				\IfFileExists{\@pastaquestoes/#2.jpg}{%
					\includegraphics[width=#1]{\@pastaquestoes/#2.jpg}%
				}{%
					\IfFileExists{\@pastaquestoes/#2.jpeg}{%
						\includegraphics[width=#1]{\@pastaquestoes/#2.jpeg}%
					}{%
						\textit{Figura não encontrada: \@pastaquestoes/#2}%
		}}}}
		
		\vspace{0.15cm}
		
		\textbf{Figura \thefiguraquestao.} #3
		
		
	\end{center}
	
	\vspace{0.2cm}
}

