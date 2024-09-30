import { Pool } from 'pg';
declare const pool: Pool;
declare const query: (text: string, params?: any[]) => Promise<import("pg").QueryResult<any>>;
export { pool, query };
//# sourceMappingURL=connections.d.ts.map