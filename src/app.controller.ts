import { Body, Controller, Get, NotFoundException, Post } from '@nestjs/common';
import { AppService } from './app.service';
import { PrismaService } from './prisma/prisma.service';
import { log } from 'console';

@Controller()
export class AppController {
  constructor(
    private readonly appService: AppService,
    private readonly prismaService: PrismaService,
  ) {}

  @Get()
  getHello(): string {
    log('getHello');
    return this.appService.getHello();
  }

  @Get('users')
  async getUsers() {
    log('getUsers');
    return this.prismaService.user.findMany();
  }

  @Post('user')
  async createUser(@Body() body: { email: string }) {
    const hasEmail = await this.prismaService.user.findFirst({
      where: { email: body.email },
    });
    if (hasEmail) {
      throw new NotFoundException('Email already exists');
    }
    log('createUser', body);
    return this.prismaService.user.create({
      data: {
        email: body.email,
      },
    });
  }
}
