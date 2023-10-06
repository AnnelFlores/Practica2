import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

const createUser = async () => {
   const userCreated = await prisma.usuario.create({
        data: {
            nombre: "Valeria",
            apellido: "Flores Reyes",
            Direccion: "Miraflores",
            Telefono: 968829502,
            correo: "valeria@gmail.com",
            rol: "Admin",
        }
    });
    console.log(userCreated);

    const createContrato = await prisma.contrato.create({
        data: {
            id_pago: 11,
            id_local: 11,
            fecha_inicio: new Date("2023-10-06T00:00:00Z"),
            fecha_fin: new Date("2023-10-08T00:00:00Z"),
            terminos: "abcd",
            numero_invitados: 150,
            estado: "Reservado",
            id_userfk:userCreated.id_user
        }
    }); 
    console.log(createContrato);
    //tabla transaccional
    const createCalifContrato = await prisma.calificacion_Contrato.create({
        data: {
            calificacion: 4,
            comentario: "Buen Servicio",
            fecha_calificacion: new Date("2023-10-06T00:00:00Z"),
            id_userfk:userCreated.id_user,
            id_contratofk:createContrato.id_contrato
        }
    });
    console.log(createCalifContrato);
};
const querycalifcontrato= async ()=>{
    const Califcontrato= await prisma.calificacion_Contrato.findMany({
        include:{
            contrato:true
        }
        , where:{
            id_calif:2
        }
    })
    console.log(Califcontrato);
};

const updatecalifcontrato = async ()=>{
    const Califcontrato = await prisma.calificacion_Contrato.update({
        data:{
            calificacion:5
        },
        where:{
            id_calif:2
        }
    })
};

const deletecalifcontrato= async ()=>{
    const user= await prisma.calificacion_Contrato.delete({
        where:{
            id_calif:2
        }
    })
};

(async ()=>{
    //await createUser()
    //await querycalifcontrato()
    //await updatecalifcontrato()
    await deletecalifcontrato()
})()