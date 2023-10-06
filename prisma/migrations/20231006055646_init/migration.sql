-- CreateTable
CREATE TABLE "Usuario" (
    "id_user" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "Direccion" TEXT,
    "Telefono" INTEGER NOT NULL,
    "correo" TEXT NOT NULL,
    "rol" TEXT NOT NULL,

    CONSTRAINT "Usuario_pkey" PRIMARY KEY ("id_user")
);

-- CreateTable
CREATE TABLE "Contrato" (
    "id_contrato" SERIAL NOT NULL,
    "id_pago" INTEGER NOT NULL,
    "id_userfk" INTEGER NOT NULL,
    "id_local" INTEGER NOT NULL,
    "fecha_inicio" TIMESTAMP(3) NOT NULL,
    "fecha_fin" TIMESTAMP(3) NOT NULL,
    "terminos" TEXT,
    "numero_invitados" INTEGER NOT NULL,
    "estado" TEXT NOT NULL,

    CONSTRAINT "Contrato_pkey" PRIMARY KEY ("id_contrato")
);

-- CreateTable
CREATE TABLE "Calificacion_Contrato" (
    "id_calif" SERIAL NOT NULL,
    "calificacion" INTEGER NOT NULL,
    "comentario" TEXT,
    "fecha_calificacion" TIMESTAMP(3) NOT NULL,
    "id_userfk" INTEGER NOT NULL,
    "id_contratofk" INTEGER NOT NULL,

    CONSTRAINT "Calificacion_Contrato_pkey" PRIMARY KEY ("id_calif")
);

-- CreateIndex
CREATE UNIQUE INDEX "Usuario_correo_key" ON "Usuario"("correo");

-- AddForeignKey
ALTER TABLE "Contrato" ADD CONSTRAINT "Contrato_id_userfk_fkey" FOREIGN KEY ("id_userfk") REFERENCES "Usuario"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Calificacion_Contrato" ADD CONSTRAINT "Calificacion_Contrato_id_userfk_fkey" FOREIGN KEY ("id_userfk") REFERENCES "Usuario"("id_user") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Calificacion_Contrato" ADD CONSTRAINT "Calificacion_Contrato_id_contratofk_fkey" FOREIGN KEY ("id_contratofk") REFERENCES "Contrato"("id_contrato") ON DELETE RESTRICT ON UPDATE CASCADE;
