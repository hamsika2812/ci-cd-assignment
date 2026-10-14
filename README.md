# ci-cd-assignment

Small Express service with a full CI/CD pipeline.

- `npm start` runs the app on port 3000
- `npm test` runs Jest tests
- `npm run lint` runs ESLint
- `docker build -t ci-cd-assignment .` builds the image

Pipeline: `.github/workflows/ci.yml` (lint + test on every push/PR, Docker Hub push from `main`).
Required repository secrets: `DOCKERHUB_USERNAME`, `DOCKERHUB_TOKEN`.
