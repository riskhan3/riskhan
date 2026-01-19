import { IsString, IsEmail, IsNotEmpty, MinLength } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class RegisterDto {
    @ApiProperty({ example: 'ahmad@example.com' })
    @IsEmail()
    @IsNotEmpty()
    email: string;

    @ApiProperty({ example: 'password123', minLength: 6 })
    @IsString()
    @MinLength(6)
    password: string;

    @ApiProperty({ example: 'Ahmad Rizky' })
    @IsString()
    @IsNotEmpty()
    name: string;

    @ApiProperty({ example: '08123456789' })
    @IsString()
    @IsNotEmpty()
    phone: string;

    @ApiProperty({ example: 'Jl. Sudirman No. 1' })
    @IsString()
    @IsNotEmpty()
    address: string;
}
