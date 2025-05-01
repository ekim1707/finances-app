export type Session = {
  __typename: "Session";
  id: string;
  title?: string | null;
  startTime: string;
  history?: Array<SessionHistory | null> | null;
};

export type SessionHistory = {
  __typename: "SessionHistory";
  type: string;
  content: string;
  metadata?: string | null;
};
