// Resolve a file in public/ against the deck base path (/talks/campamento-de-agentes/).
export const asset = (path: string): string =>
  `${import.meta.env.BASE_URL.replace(/\/?$/, '/')}${path.replace(/^\//, '')}`;
