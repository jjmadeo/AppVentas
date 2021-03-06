using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using Serilog;

namespace Servicios
{
    public class Startup
    {
        readonly string ReglasCorse = "_myAllowSpecificOrigins";

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(name: ReglasCorse,
                                  builder =>
                                  {
                                      builder.WithOrigins("http://localhost:81", "http://185.254.205.224:80","http://185.254.205.224", "http://localhost", "http://localhost:80").AllowAnyHeader().AllowAnyMethod();
                                  });
            });

            services.AddControllers();

            services.AddSwaggerGen(config =>
                config.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo
                {
                    Title="APP Ventas",
                    Version="v1"
                    
                }
                ));

            services.AddControllersWithViews().AddNewtonsoftJson(opt => opt.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore);
           

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
                    .AddJwtBearer(options=> 
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidIssuer = "upe.com",
                        ValidAudience = "upe.com",
                        IssuerSigningKey = new SymmetricSecurityKey(
                        Encoding.UTF8.GetBytes("asdasdasdasdasgsaherezdasdcsadsadasdasdsadasdsadssssssssssssssssssssssadasdadasd")),
                        ClockSkew = TimeSpan.Zero
                    }

                    );




        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env,ILoggerFactory loggerFactory)
        {
            loggerFactory.AddFile("c:/logs/archivo.log");


            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseAuthentication();

            app.UseRouting();

            app.UseCors(ReglasCorse);

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });

            app.UseSwagger();
            app.UseSwaggerUI(c =>
            {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "Api Ventas");
            });


        }
    }
}
