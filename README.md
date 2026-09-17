## Monitoring and Observability

The project uses the Grafana LGTM components for centralized log monitoring:

- **Loki:** Log aggregation
- **Promtail:** Collects Docker container logs and forwards them to Loki
- **Grafana:** Visualizes logs through dashboards and Explore

### Access URLs

| Service | URL |
|---|---|
| Application | `http://127.0.0.1:31882` |
| Application Health Check | `http://127.0.0.1:31882/healthz` |
| Loki | `http://localhost:3100` |
| Grafana | `http://localhost:3001` |

### LogQL Query

Use the following query in Grafana Explore:

```logql
{job="nomad-nginx"}## devops-intern-final
### By Rajeev Bhardwaj
