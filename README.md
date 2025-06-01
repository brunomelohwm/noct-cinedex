# noct_cinedex -  Flutter Movie App

A personal Flutter project focused on displaying popular movies with a clean and organized UI, following clean architecture and development best practices.

---

## About the Project

This app consumes a popular movies API (TMDB), showing cards with basic details like title, short synopsis, rating, and release date.

While the final feature might seem simple, the underlying work is detailed and thorough:

- Clean Architecture structure  
- Data Source, Repository, Use Case, Cubit/Bloc, and Presentation layers  
- Robust error handling  
- Unit tests covering models, datasource, repository, use cases, and bloc  
- CI pipeline set up with GitHub Actions, including static analysis, tests with a minimum 70% coverage threshold, and coverage reports

This project serves as a learning space and technical showcase — proving that well-crafted code is about care and discipline, not just functionality.

---

## Running the Project

1. Clone the repo:  
   ```bash
   git clone https://github.com/brunomelohwm/noct_cinedex.git

Project Structure:

lib/
 ├── data/            # Data Sources e Repositories
 ├── domain/          # UseCases e Modelos de domínio
 ├── presentation/    # UI, Cubit(state management)
 ├── core/            # Tratamento de erros e utilitários
assets/
 └── config/          # Configurações, incluindo .env
test/                 # Testes unitários


Next Steps
 - Implement more screens and features

 - Improve UX/UI with animations and feedback

 - Expand test coverage



