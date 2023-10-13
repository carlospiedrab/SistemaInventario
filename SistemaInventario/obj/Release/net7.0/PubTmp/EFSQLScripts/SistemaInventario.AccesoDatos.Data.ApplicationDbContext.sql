IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE TABLE [AspNetRoles] (
        [Id] nvarchar(450) NOT NULL,
        [Name] nvarchar(256) NULL,
        [NormalizedName] nvarchar(256) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoles] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE TABLE [AspNetUsers] (
        [Id] nvarchar(450) NOT NULL,
        [UserName] nvarchar(256) NULL,
        [NormalizedUserName] nvarchar(256) NULL,
        [Email] nvarchar(256) NULL,
        [NormalizedEmail] nvarchar(256) NULL,
        [EmailConfirmed] bit NOT NULL,
        [PasswordHash] nvarchar(max) NULL,
        [SecurityStamp] nvarchar(max) NULL,
        [ConcurrencyStamp] nvarchar(max) NULL,
        [PhoneNumber] nvarchar(max) NULL,
        [PhoneNumberConfirmed] bit NOT NULL,
        [TwoFactorEnabled] bit NOT NULL,
        [LockoutEnd] datetimeoffset NULL,
        [LockoutEnabled] bit NOT NULL,
        [AccessFailedCount] int NOT NULL,
        CONSTRAINT [PK_AspNetUsers] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE TABLE [AspNetRoleClaims] (
        [Id] int NOT NULL IDENTITY,
        [RoleId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE TABLE [AspNetUserClaims] (
        [Id] int NOT NULL IDENTITY,
        [UserId] nvarchar(450) NOT NULL,
        [ClaimType] nvarchar(max) NULL,
        [ClaimValue] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE TABLE [AspNetUserLogins] (
        [LoginProvider] nvarchar(128) NOT NULL,
        [ProviderKey] nvarchar(128) NOT NULL,
        [ProviderDisplayName] nvarchar(max) NULL,
        [UserId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY ([LoginProvider], [ProviderKey]),
        CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE TABLE [AspNetUserRoles] (
        [UserId] nvarchar(450) NOT NULL,
        [RoleId] nvarchar(450) NOT NULL,
        CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY ([UserId], [RoleId]),
        CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AspNetRoles] ([Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE TABLE [AspNetUserTokens] (
        [UserId] nvarchar(450) NOT NULL,
        [LoginProvider] nvarchar(128) NOT NULL,
        [Name] nvarchar(128) NOT NULL,
        [Value] nvarchar(max) NULL,
        CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY ([UserId], [LoginProvider], [Name]),
        CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AspNetUsers] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE INDEX [IX_AspNetRoleClaims_RoleId] ON [AspNetRoleClaims] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [RoleNameIndex] ON [AspNetRoles] ([NormalizedName]) WHERE [NormalizedName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE INDEX [IX_AspNetUserClaims_UserId] ON [AspNetUserClaims] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE INDEX [IX_AspNetUserLogins_UserId] ON [AspNetUserLogins] ([UserId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE INDEX [IX_AspNetUserRoles_RoleId] ON [AspNetUserRoles] ([RoleId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    CREATE INDEX [EmailIndex] ON [AspNetUsers] ([NormalizedEmail]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    EXEC(N'CREATE UNIQUE INDEX [UserNameIndex] ON [AspNetUsers] ([NormalizedUserName]) WHERE [NormalizedUserName] IS NOT NULL');
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304161716_AgregarMigracionIdentidad')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230304161716_AgregarMigracionIdentidad', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304232702_AgregarBodegaMigracion')
BEGIN
    CREATE TABLE [Bodegas] (
        [Id] int NOT NULL IDENTITY,
        [Nombre] nvarchar(60) NOT NULL,
        [Descripcion] nvarchar(100) NOT NULL,
        [Estado] bit NOT NULL,
        CONSTRAINT [PK_Bodegas] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230304232702_AgregarBodegaMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230304232702_AgregarBodegaMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230314021232_AgregarCategoriaMigracion')
BEGIN
    CREATE TABLE [Categorias] (
        [Id] int NOT NULL IDENTITY,
        [Nombre] nvarchar(60) NOT NULL,
        [Descripcion] nvarchar(100) NOT NULL,
        [Estado] bit NOT NULL,
        CONSTRAINT [PK_Categorias] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230314021232_AgregarCategoriaMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230314021232_AgregarCategoriaMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315031204_AgregarMarcaMigracion')
BEGIN
    CREATE TABLE [Marcas] (
        [Id] int NOT NULL IDENTITY,
        [Nombre] nvarchar(60) NOT NULL,
        [Descripcion] nvarchar(100) NOT NULL,
        [Estado] bit NOT NULL,
        CONSTRAINT [PK_Marcas] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230315031204_AgregarMarcaMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230315031204_AgregarMarcaMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230316035143_AgregarProductoMigracion')
BEGIN
    CREATE TABLE [Productos] (
        [Id] int NOT NULL IDENTITY,
        [NumeroSerie] nvarchar(60) NOT NULL,
        [Descripcion] nvarchar(100) NOT NULL,
        [Precio] float NOT NULL,
        [Costo] float NOT NULL,
        [ImagenUrl] nvarchar(max) NULL,
        [Estado] bit NOT NULL,
        [CategoriaId] int NOT NULL,
        [MarcaId] int NOT NULL,
        [PadreId] int NULL,
        CONSTRAINT [PK_Productos] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Productos_Categorias_CategoriaId] FOREIGN KEY ([CategoriaId]) REFERENCES [Categorias] ([Id]),
        CONSTRAINT [FK_Productos_Marcas_MarcaId] FOREIGN KEY ([MarcaId]) REFERENCES [Marcas] ([Id]),
        CONSTRAINT [FK_Productos_Productos_PadreId] FOREIGN KEY ([PadreId]) REFERENCES [Productos] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230316035143_AgregarProductoMigracion')
BEGIN
    CREATE INDEX [IX_Productos_CategoriaId] ON [Productos] ([CategoriaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230316035143_AgregarProductoMigracion')
BEGIN
    CREATE INDEX [IX_Productos_MarcaId] ON [Productos] ([MarcaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230316035143_AgregarProductoMigracion')
BEGIN
    CREATE INDEX [IX_Productos_PadreId] ON [Productos] ([PadreId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230316035143_AgregarProductoMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230316035143_AgregarProductoMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230404034903_AgregarCamposTablaUsuarioMigracion')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Apellidos] nvarchar(80) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230404034903_AgregarCamposTablaUsuarioMigracion')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Ciudad] nvarchar(60) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230404034903_AgregarCamposTablaUsuarioMigracion')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Direccion] nvarchar(200) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230404034903_AgregarCamposTablaUsuarioMigracion')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Discriminator] nvarchar(max) NOT NULL DEFAULT N'';
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230404034903_AgregarCamposTablaUsuarioMigracion')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Nombres] nvarchar(80) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230404034903_AgregarCamposTablaUsuarioMigracion')
BEGIN
    ALTER TABLE [AspNetUsers] ADD [Pais] nvarchar(60) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230404034903_AgregarCamposTablaUsuarioMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230404034903_AgregarCamposTablaUsuarioMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414032237_AgregarBodegaProductoMigracion')
BEGIN
    DECLARE @var0 sysname;
    SELECT @var0 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUserTokens]') AND [c].[name] = N'Name');
    IF @var0 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUserTokens] DROP CONSTRAINT [' + @var0 + '];');
    ALTER TABLE [AspNetUserTokens] ALTER COLUMN [Name] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414032237_AgregarBodegaProductoMigracion')
BEGIN
    DECLARE @var1 sysname;
    SELECT @var1 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUserTokens]') AND [c].[name] = N'LoginProvider');
    IF @var1 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUserTokens] DROP CONSTRAINT [' + @var1 + '];');
    ALTER TABLE [AspNetUserTokens] ALTER COLUMN [LoginProvider] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414032237_AgregarBodegaProductoMigracion')
BEGIN
    DECLARE @var2 sysname;
    SELECT @var2 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUserLogins]') AND [c].[name] = N'ProviderKey');
    IF @var2 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUserLogins] DROP CONSTRAINT [' + @var2 + '];');
    ALTER TABLE [AspNetUserLogins] ALTER COLUMN [ProviderKey] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414032237_AgregarBodegaProductoMigracion')
BEGIN
    DECLARE @var3 sysname;
    SELECT @var3 = [d].[name]
    FROM [sys].[default_constraints] [d]
    INNER JOIN [sys].[columns] [c] ON [d].[parent_column_id] = [c].[column_id] AND [d].[parent_object_id] = [c].[object_id]
    WHERE ([d].[parent_object_id] = OBJECT_ID(N'[AspNetUserLogins]') AND [c].[name] = N'LoginProvider');
    IF @var3 IS NOT NULL EXEC(N'ALTER TABLE [AspNetUserLogins] DROP CONSTRAINT [' + @var3 + '];');
    ALTER TABLE [AspNetUserLogins] ALTER COLUMN [LoginProvider] nvarchar(450) NOT NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414032237_AgregarBodegaProductoMigracion')
BEGIN
    CREATE TABLE [BodegasProductos] (
        [Id] int NOT NULL IDENTITY,
        [BodegaId] int NOT NULL,
        [ProductoId] int NOT NULL,
        [Cantidad] int NOT NULL,
        CONSTRAINT [PK_BodegasProductos] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_BodegasProductos_Bodegas_BodegaId] FOREIGN KEY ([BodegaId]) REFERENCES [Bodegas] ([Id]),
        CONSTRAINT [FK_BodegasProductos_Productos_ProductoId] FOREIGN KEY ([ProductoId]) REFERENCES [Productos] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414032237_AgregarBodegaProductoMigracion')
BEGIN
    CREATE INDEX [IX_BodegasProductos_BodegaId] ON [BodegasProductos] ([BodegaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414032237_AgregarBodegaProductoMigracion')
BEGIN
    CREATE INDEX [IX_BodegasProductos_ProductoId] ON [BodegasProductos] ([ProductoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230414032237_AgregarBodegaProductoMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230414032237_AgregarBodegaProductoMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415154751_AgregarInventarioMigracion')
BEGIN
    CREATE TABLE [Inventarios] (
        [Id] int NOT NULL IDENTITY,
        [UsuarioAplicacionId] nvarchar(450) NOT NULL,
        [FechaInicial] datetime2 NOT NULL,
        [FechaFinal] datetime2 NOT NULL,
        [BodegaId] int NOT NULL,
        [Estado] bit NOT NULL,
        CONSTRAINT [PK_Inventarios] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Inventarios_AspNetUsers_UsuarioAplicacionId] FOREIGN KEY ([UsuarioAplicacionId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_Inventarios_Bodegas_BodegaId] FOREIGN KEY ([BodegaId]) REFERENCES [Bodegas] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415154751_AgregarInventarioMigracion')
BEGIN
    CREATE INDEX [IX_Inventarios_BodegaId] ON [Inventarios] ([BodegaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415154751_AgregarInventarioMigracion')
BEGIN
    CREATE INDEX [IX_Inventarios_UsuarioAplicacionId] ON [Inventarios] ([UsuarioAplicacionId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415154751_AgregarInventarioMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230415154751_AgregarInventarioMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415175630_AgregarInventarioDetalleMigracion')
BEGIN
    CREATE TABLE [InventarioDetalles] (
        [Id] int NOT NULL IDENTITY,
        [InventarioId] int NOT NULL,
        [ProductoId] int NOT NULL,
        [StockAnterior] int NOT NULL,
        [Cantidad] int NOT NULL,
        CONSTRAINT [PK_InventarioDetalles] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_InventarioDetalles_Inventarios_InventarioId] FOREIGN KEY ([InventarioId]) REFERENCES [Inventarios] ([Id]),
        CONSTRAINT [FK_InventarioDetalles_Productos_ProductoId] FOREIGN KEY ([ProductoId]) REFERENCES [Productos] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415175630_AgregarInventarioDetalleMigracion')
BEGIN
    CREATE INDEX [IX_InventarioDetalles_InventarioId] ON [InventarioDetalles] ([InventarioId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415175630_AgregarInventarioDetalleMigracion')
BEGIN
    CREATE INDEX [IX_InventarioDetalles_ProductoId] ON [InventarioDetalles] ([ProductoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415175630_AgregarInventarioDetalleMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230415175630_AgregarInventarioDetalleMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415211129_AgregarKardexInventarioMigracion')
BEGIN
    CREATE TABLE [KardexInventarios] (
        [Id] int NOT NULL IDENTITY,
        [BodegaProductoId] int NOT NULL,
        [Tipo] nvarchar(100) NOT NULL,
        [Detalle] nvarchar(max) NOT NULL,
        [StockAnterior] int NOT NULL,
        [Cantidad] int NOT NULL,
        [Costo] float NOT NULL,
        [Stock] int NOT NULL,
        [Total] float NOT NULL,
        [UsuarioAplicacionId] nvarchar(450) NOT NULL,
        [FechaRegistro] datetime2 NOT NULL,
        CONSTRAINT [PK_KardexInventarios] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_KardexInventarios_AspNetUsers_UsuarioAplicacionId] FOREIGN KEY ([UsuarioAplicacionId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_KardexInventarios_BodegasProductos_BodegaProductoId] FOREIGN KEY ([BodegaProductoId]) REFERENCES [BodegasProductos] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415211129_AgregarKardexInventarioMigracion')
BEGIN
    CREATE INDEX [IX_KardexInventarios_BodegaProductoId] ON [KardexInventarios] ([BodegaProductoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415211129_AgregarKardexInventarioMigracion')
BEGIN
    CREATE INDEX [IX_KardexInventarios_UsuarioAplicacionId] ON [KardexInventarios] ([UsuarioAplicacionId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230415211129_AgregarKardexInventarioMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230415211129_AgregarKardexInventarioMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230507181004_AregarCompaniaMigracion')
BEGIN
    CREATE TABLE [Companias] (
        [Id] int NOT NULL IDENTITY,
        [Nombre] nvarchar(60) NOT NULL,
        [Descripcion] nvarchar(100) NOT NULL,
        [Pais] nvarchar(60) NOT NULL,
        [Ciudad] nvarchar(60) NOT NULL,
        [Direccion] nvarchar(100) NOT NULL,
        [Telefono] nvarchar(40) NOT NULL,
        [BodegaVentaId] int NOT NULL,
        [CreadoPorId] nvarchar(450) NULL,
        [ActualizadoPorId] nvarchar(450) NULL,
        [FechaCreacion] datetime2 NOT NULL,
        [FechaActualizacion] datetime2 NOT NULL,
        CONSTRAINT [PK_Companias] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Companias_AspNetUsers_ActualizadoPorId] FOREIGN KEY ([ActualizadoPorId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_Companias_AspNetUsers_CreadoPorId] FOREIGN KEY ([CreadoPorId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_Companias_Bodegas_BodegaVentaId] FOREIGN KEY ([BodegaVentaId]) REFERENCES [Bodegas] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230507181004_AregarCompaniaMigracion')
BEGIN
    CREATE INDEX [IX_Companias_ActualizadoPorId] ON [Companias] ([ActualizadoPorId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230507181004_AregarCompaniaMigracion')
BEGIN
    CREATE INDEX [IX_Companias_BodegaVentaId] ON [Companias] ([BodegaVentaId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230507181004_AregarCompaniaMigracion')
BEGIN
    CREATE INDEX [IX_Companias_CreadoPorId] ON [Companias] ([CreadoPorId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230507181004_AregarCompaniaMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230507181004_AregarCompaniaMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230509010818_AgregarCarroCompraMigracion')
BEGIN
    CREATE TABLE [CarroCompras] (
        [Id] int NOT NULL IDENTITY,
        [UsuarioAplicacionId] nvarchar(450) NOT NULL,
        [ProductoId] int NOT NULL,
        [Cantidad] int NOT NULL,
        CONSTRAINT [PK_CarroCompras] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_CarroCompras_AspNetUsers_UsuarioAplicacionId] FOREIGN KEY ([UsuarioAplicacionId]) REFERENCES [AspNetUsers] ([Id]),
        CONSTRAINT [FK_CarroCompras_Productos_ProductoId] FOREIGN KEY ([ProductoId]) REFERENCES [Productos] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230509010818_AgregarCarroCompraMigracion')
BEGIN
    CREATE INDEX [IX_CarroCompras_ProductoId] ON [CarroCompras] ([ProductoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230509010818_AgregarCarroCompraMigracion')
BEGIN
    CREATE INDEX [IX_CarroCompras_UsuarioAplicacionId] ON [CarroCompras] ([UsuarioAplicacionId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230509010818_AgregarCarroCompraMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230509010818_AgregarCarroCompraMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230513004338_AgregarOrdenMigracion')
BEGIN
    CREATE TABLE [Ordenes] (
        [Id] int NOT NULL IDENTITY,
        [UsuarioAplicacionId] nvarchar(450) NOT NULL,
        [FechaOrden] datetime2 NOT NULL,
        [FechaEnvio] datetime2 NOT NULL,
        [NumeroEnvio] nvarchar(max) NULL,
        [Carrier] nvarchar(max) NULL,
        [TotalOrden] float NOT NULL,
        [EstadoOrden] nvarchar(max) NOT NULL,
        [EstadoPago] nvarchar(max) NOT NULL,
        [FechaPago] datetime2 NOT NULL,
        [FechaMaximaPago] datetime2 NOT NULL,
        [TransaccionId] nvarchar(max) NULL,
        [Telefono] nvarchar(max) NULL,
        [Direccion] nvarchar(max) NULL,
        [Ciudad] nvarchar(max) NULL,
        [Pais] nvarchar(max) NULL,
        [NombresCliente] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Ordenes] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Ordenes_AspNetUsers_UsuarioAplicacionId] FOREIGN KEY ([UsuarioAplicacionId]) REFERENCES [AspNetUsers] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230513004338_AgregarOrdenMigracion')
BEGIN
    CREATE INDEX [IX_Ordenes_UsuarioAplicacionId] ON [Ordenes] ([UsuarioAplicacionId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230513004338_AgregarOrdenMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230513004338_AgregarOrdenMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230513193632_AgregarOrdenDetalleMigracion')
BEGIN
    CREATE TABLE [OrdenDetalles] (
        [Id] int NOT NULL IDENTITY,
        [OrdenId] int NOT NULL,
        [ProductoId] int NOT NULL,
        [Cantidad] int NOT NULL,
        [Precio] float NOT NULL,
        CONSTRAINT [PK_OrdenDetalles] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_OrdenDetalles_Ordenes_OrdenId] FOREIGN KEY ([OrdenId]) REFERENCES [Ordenes] ([Id]),
        CONSTRAINT [FK_OrdenDetalles_Productos_ProductoId] FOREIGN KEY ([ProductoId]) REFERENCES [Productos] ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230513193632_AgregarOrdenDetalleMigracion')
BEGIN
    CREATE INDEX [IX_OrdenDetalles_OrdenId] ON [OrdenDetalles] ([OrdenId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230513193632_AgregarOrdenDetalleMigracion')
BEGIN
    CREATE INDEX [IX_OrdenDetalles_ProductoId] ON [OrdenDetalles] ([ProductoId]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230513193632_AgregarOrdenDetalleMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230513193632_AgregarOrdenDetalleMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230523004423_AgregarSessionIdEnOrdenMigracion')
BEGIN
    ALTER TABLE [Ordenes] ADD [SessionId] nvarchar(max) NULL;
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20230523004423_AgregarSessionIdEnOrdenMigracion')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20230523004423_AgregarSessionIdEnOrdenMigracion', N'7.0.4');
END;
GO

COMMIT;
GO

