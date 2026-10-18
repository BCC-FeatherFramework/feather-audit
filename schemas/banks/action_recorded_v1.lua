-- bcc-banks: one event per bank action (account, access, deposit/withdrawal,
-- transfer, check, loan, safety-deposit box, gold exchange, branch reserve and
-- staff settings). `action` is the snake-case action name, `details` a bounded
-- summary of its facts. Owner: bcc-banks (BCC-FeatherFramework).
FeatherAuditSchemaRegistry.Register({
    eventType = 'bank.action.recorded', eventVersion = 1,
    actorTypes = { character = true, system = true },
    minimumTargets = 1, minimumSensitivity = 'internal', retentionClass = 'financial',
    readProjection = { action = 'internal', actor_name = 'internal', actor_character_id = 'internal', details = 'restricted' },
    context = { type = 'object', fields = {
        action = { type = 'string', required = true, maxBytes = 100 },
        details = { type = 'string', required = true, maxBytes = 500 },
        actor_name = { type = 'string', maxBytes = 128 },
        actor_character_id = { type = 'string', maxBytes = 128 }
    } }
})
