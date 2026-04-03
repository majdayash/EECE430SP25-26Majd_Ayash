from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = []

    operations = [
        migrations.CreateModel(
            name='Player',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('date_joined', models.DateField()),
                ('position', models.CharField(choices=[('Setter', 'Setter'), ('Outside Hitter', 'Outside Hitter'), ('Middle Blocker', 'Middle Blocker'), ('Opposite', 'Opposite'), ('Libero', 'Libero'), ('Defensive Specialist', 'Defensive Specialist')], max_length=50)),
                ('salary', models.DecimalField(decimal_places=2, max_digits=10)),
                ('contact_person', models.CharField(max_length=100)),
            ],
            options={'ordering': ['id']},
        ),
    ]
