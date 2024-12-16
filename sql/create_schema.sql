create table if not exists rol (
    id serial primary key,
    name varchar(50) not null,
    description text,
    logo varchar(255),
    created_at TIMESTAMP not null,
    updated_at TIMESTAMP not null
);

create table if not exists "users" (
    id serial primary key,
    id_rol bigint,
    name varchar(50),
    photo text,
    address text,
    email varchar(50) unique,
    password varchar(255),
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    constraint fk_user_rol
        foreign key (id_rol)
        references rol(id)
        on delete cascade
);
