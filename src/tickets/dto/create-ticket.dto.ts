import { IsString, IsNotEmpty } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class CreateTicketDto {
    @ApiProperty({ example: 'Internet Lambat' })
    @IsString()
    @IsNotEmpty()
    category: string;

    @ApiProperty({ example: 'Koneksi putus nyambung sejak pagi' })
    @IsString()
    @IsNotEmpty()
    subject: string;

    @ApiProperty({ example: 'Mohon dibantu segera' })
    @IsString()
    @IsNotEmpty()
    description: string;
}
