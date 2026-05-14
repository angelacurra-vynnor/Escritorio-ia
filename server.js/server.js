const express = require("express");
const fs = require("fs");
const path = require("path");
const yaml = require("js-yaml");

const app = express();
const port = process.env.PORT || 3000;

app.use(express.json());

const agentsPath = path.join(__dirname, "agents");

function loadAgents() {
    const files = fs.readdirSync(agentsPath).filter(file => file.endsWith(".yaml"));

    return files.map(file => {
        const filePath = path.join(agentsPath, file);
        const content = fs.readFileSync(filePath, "utf8");
        const data = yaml.load(content);

        return {
            id: file.replace(".yaml", ""),
            file,
            ...data
        };
    });
}

app.get("/", (req, res) => {
    res.send("Escritório IA rodando na VPS 🚀");
});

app.get("/agents", (req, res) => {
    const agents = loadAgents();
    res.json(agents);
});

app.get("/agents/:id", (req, res) => {
    const agents = loadAgents();
    const agent = agents.find(a => a.id === req.params.id);

    if (!agent) {
        return res.status(404).json({ error: "Agente não encontrado" });
    }

    res.json(agent);
});

app.listen(port, () => {
    console.log(`Servidor rodando na porta ${port}`);
});