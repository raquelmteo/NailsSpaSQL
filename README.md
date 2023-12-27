This is a project that demonstrates a relational model by applying transformation steps to the entity-relationships model and scripting the defined tables in SQL.

An owner of a Beauty Spa would like an Information System for
Generate data from your store's attendances. The spa has several services with different values
of billing. Some employees cater to all specialties and others do not. Each service
belongs to a specialty. Each appointment will be made by the client with an employee,
on a certain date and time.

Entities - Attributes:
Cliente (nif, nome, telefone, email, localidade)
Servico (cod_servico, nome_servico, valor, especialidade)
Atendente (cod_atendente, nome_atendente)
Agendamento (cod_agendamento, data_agendamento, hora_agendamento)

Relationships:
agenda (Cliente, Agendamento) N:1 p/t
tipo_servico (Agendamento, Servico) 1:N t/p
atende_servico (Servico, Atendente) M:N p/p
atende_agendamento (Agendamento, Atendente) 1:N t/p
