import { Controller, Get, Post, Body, UseGuards, Request } from '@nestjs/common';
import { TicketsService } from './tickets.service';
import { AuthGuard } from '@nestjs/passport';
import { ApiTags, ApiOperation, ApiBearerAuth } from '@nestjs/swagger';
import { CreateTicketDto } from './dto/create-ticket.dto';

@ApiTags('Tickets')
@ApiBearerAuth()
@UseGuards(AuthGuard('jwt'))
@Controller('tickets')
export class TicketsController {
    constructor(private readonly ticketsService: TicketsService) { }

    @Post()
    @ApiOperation({ summary: 'Create a support ticket' })
    createTicket(@Request() req: any, @Body() createTicketDto: CreateTicketDto) {
        return this.ticketsService.createTicket(req.user.userId, createTicketDto);
    }

    @Get()
    @ApiOperation({ summary: 'Get all tickets for current user' })
    getUserTickets(@Request() req: any) {
        return this.ticketsService.getUserTickets(req.user.userId);
    }
}
