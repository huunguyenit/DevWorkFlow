<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE grid [
  <!ENTITY EventsEmail SYSTEM "..\Include\Command\EventsEmailCommand.txt">
  <!ENTITY CheckAccess "if @@admin = 0 and not exists(select 1 from sysevents where id = @id and (user_id0 = @@userID or dbo.ff_ExactInlist(@userName, assigned_name) = 1 or user_id0 in (select a.id from vsysuserinfo a join (select restrict_users from vsysuserinfo where id = @@userID) b on ',' + replace(replace(rtrim(b.restrict_users), ' ,', ','), ', ', ',') + ',' like '&#37;,' + rtrim(a.name) + ',&#37;'))) begin
  select '' as message, '' as fields, '' as script
  return
end">
]>


<grid table="sysevents" code="id" xmlns="urn:schemas-fast-com:data-grid">
  <title v="" e=""></title>
  <subTitle v="" e=""></subTitle>

  <fields>
    <field name="id" isPrimaryKey="true" width="100" allowSorting="true" allowFilter="true">
      <header v="Id" e="Id"></header>
    </field>
  </fields>
  <views>
    <view id="Grid">
      <field name="id"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu9Ge+QSms2Uij978RkGV9TmEqu0FEZexEv//0lWIMT1oHG5vxWoV7/6xUBgnUSEqyRkYo9AvTzzACEfU4sHf7K00+ova8cBqIapkUGWrXHPjAC2gW+PbprtTO6fBeaSZT4PhngCZA9505K+N2f/rIQJrG9cKpNIT5fXxptHHbpDHW8AoYjk4WFQnF+YKV61TRk+NErcp30N4/W4/eG1bYmxxnlWB/CTFTpyEhphTHz4w38Es9yW/bkEW3fqHt/HwxJ9l1HwmVWB8z99CpKanIA/yZEzqA5y21lrHcOmvehk6hZ//gFrBx9NDFTH00/3vCf06GBI3EIvUdfEUGQVldXOf4GC2F9i8TQ+E8VvZFE13Wzbzzwt2aLDul1vLVNHZ01oElDkE7VpppBy79bmwqlcB9Ytb0xg8Yr11Yq8T0gqzDCfUCnbfVUENen43WWHxS0z8JqL3qkR4eWXbMtoZy/GuYkT5MTctySY7qXji3Wq90EClLFE/3/Gsm/L6BrVoMlosmHYYX6BRAirVAm8QBCslrnDGoecx0ucCyINxCZOdebuRj2TcvUpQV9iGeAhUxiUbCBAs8T3Z8q0gY0ZUfTUDQaxD5trZdZiC30FmSVtEqykFsD64TJEKfcdgJdZsHCfMuUBvg9TwSE46Y4YxO8gEMBNEDHmhZj6gw1AY5az5+zasjZFTydOh5aPATntqnRDksapGXLLmvGhB7MGPWaMgyld4WeKvnQ0Xe8sHEf6DB7lT2Cfub6KOkWWHBIt7cEetzXOtC0Hz/EfEE4cHbEZcp2a9q2jPtq0ZUE0Gspv2j4aaMVEORdKLISo5XDn9yviCnnjkawEMvL3mjOHrDoSOFQ6uM0pOwUYrJ/m8wb8mlwSkFY8JZxQrXU/jzeNI7XQwsl5tc1QKCMbEmd4eFVXWU5ySUIcDhxkaUStJb8FcTLeOeCC++r0laPA9vKZ8+of/oCNP1qDUnMpYHkr5BKNlbebzGcTr1TF/i1DG+j4YYTbdknoexqgDB2+jTn7zgMvPmhuimMnm0IwlSlrFvbUzG1eXG3PNzisgksklziZSoqov7a3YEhgCmjvwB/ZzMSigWMrg8SJZ5mi0JhWqRGgbcKZB6izvIX3f9pYu/Yn3YS3DMViuLTZJDBnGdZb0bOnIN3R/IbifevmqpkemKysnocqDMXHX0upj1uSoRkeTp4kULo8sssIUdjhlRHgpOYRx5gHtKZ7ehWn8gYCOq4M=</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&3H7kPWBUT0Qgbr/0jUL753ZOxbIC+LxbnrSHSw7x7wObkPS2H/Bx4sZhA2uYq2nGvDFzd4RWXLmwgc3k4lAkrqBSb8y/ZKu8bw12Es+n/4c=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtXzbQrSh4yzrH2nmccB0eyp8fIg1S5PIZj9vjXbvH/64YmoTgz2xx2OKXirXw50kkBRmqGrJISuJbFdSkoY0aQJjdcLX28pTaBQeiSwCN5bZAyO3qvWUhOTdAePF7cZytCdwsy6wsksSzxCo8aC+EdMtbUiVQKeLbweWfCa8oLcHwx4JWlUYjMZQJb327lm8k/qzbYP6LyDh1ennRKjIzSCaUwiJVpuMurrFLrBE40R/xpVjslF2wnAulPMtOp1gEZJOjJH8BJlSYu1OllS4iNvmwlDIne0UfX9rbaXeFvhwPsErrWdQKnALaU9xm1tGIO+/T4Sh6nlRWjlKJSJfF1aBrzn7Oq/JyOedUdFK6JWn1ydRjeO3qrrIqtpICmk7ah6HLtTLRC2kgtfWJgCUoStbnekMy5dXvyPXc9naIupgTW5bifZ/ijQX2Ezpy/dYOhFvk77e6On9QGfh9yXRiJcbnDVqhPsTp7Rc7mVtgv8UVr0u/Hvq3iQ82GMqt8Rdkf79DEOc2VAhPBcZmS2b6NvRiiT/LwYKngoFq2to7TbvicSRqVqbcVOYkhb+lvzSjnjXIzxNBcV0sKicGWuvL04tAguPFi0ayjEYepxv3Lg3aLATaTuo0xWHNMra6dG0OZ/Glw6eiDk3FM5vgM6KC3yiYxe1cgGtdd5opytTbS5BMc5H9t2DaGAHIjuIxokt0W621POHLE3VqTnNzG3J++gO4OUmgY/wB6MSr4fDokQSeY0kvvS/HYjIHf+gK/SYnTRbmiYprpQswHUkr8e+QP3QzMOK0G71zVwYN/nVband+86j/Z05sdzhmM28E3W89yYlLKbrSc+zv3MENI3YNNC6gVzjE/ICJ6h1Bjq1BdJAMjh5892hko7LwBBPasFPsa0zPij+4d4J9lGjNjJNhKdpzq1eb1hLh27vvtPSdGiClQgFCdwCYAQmBpGG0q/pNLyNB87RqKiH9i/nXuzewKHxH1M3E3VXDzyz7ux8KLIaAkw0lOiJQXYHGQmgw00gj7Cq9Uac0GU7qAsN9gPRGv4upLLv2rjH3WCSVKTpcU/cxxB1I5aoyt8eClrbvBW0CVmT3ZPv9NgrvQ+yj99LJfrh/FS57UbvOLMbwGcHQiLurp8kkAffxOFoOB8p09bA4Q==</Encrypted>]]>
    </text>
  </script>
  <response>

    <action id="DragEvent">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6gjce6Tyv1iviAgRGpfDRPYf36P1GVr467BLU2lC2N88B/TB4rYHgBn1mEUFnGpB5Nh9SFIHgxj3DoGUg07rIsWahuvlV9DgUyNC6Ab9WtGpuWwZaThvH1L6tpBQsyBtd3JItifwv060Gdemi+1PurgnDM4r3/D9SC9YyguJ1h56aPnsWdB41jzS+YaRxygzrvKf7LfufV6MzaKL4cYf4Y=</Encrypted>]]>&CheckAccess;<![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu52cLO9w1xJntIsfgUInTxIlIxGxaqYQoDgi6ctyBpcVh6oa7pAK4lWcWqbs4daqy+y1jzqrSdwqMa6XJ60jtmaumPYcOWvZhST1XlsRcOgIt7rQy+eQFjAN1swsYWtluw==</Encrypted>]]>&EventsEmail;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcF8fMb3M/er0xXcHGB9wLOiC2vZhIRKJT+tdgeROE1yzF4L6+ez7HieEzOh6D761J78v631GSF/HF/o1CFfgDcA=</Encrypted>]]>
      </text>
    </action>

    <action id="EventBeforeDrag">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6gjce6Tyv1iviAgRGpfDRPYf36P1GVr467BLU2lC2N88B/TB4rYHgBn1mEUFnGpB5Nh9SFIHgxj3DoGUg07rIt1yxOM03vue3MeHn2yBZXl</Encrypted>]]>&CheckAccess;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4X33JZD5zJJBkxmVO6sxPekzHo8UgPGOPY3N/JCcqpvI</Encrypted>]]>
      </text>
    </action>

    <action id="Pasted">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu8h6uOq2F514QS/Pmq2ZYx4a/qHdOogRhi0QRpXOz8aIdf8T14uOsc4Z35fTVXiTYMhKhJdUTFwoYtPrcMlzbsCEn5YQrFAqFAK5Ryy2PguTG1gRLpaJs2GXV5+9cNF+Dz4HIVVEHNsntwhvVbb7emA=</Encrypted>]]>&CheckAccess;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcNsZNeCfVlhaKfCYKA1MW+dq2329YK7BD/kjqpFwJF+aCeFY79eNaBh9aij4ycIvR3y6dJGuVaMbIeu9Hd+hF4QTHUKkqVocFDUh6vtQxQ0R4V8wBl88Xcy6WyRww+wzC5aNTq5j9ENOVObgcHUZzEdXMw0vxX2WLkw/Lwb6xwV+M+hg3qbM3iFrRCR1RB8+jjiuAG8bRTsrCIcggCJtpHaQ0EiuVclhMPWIu7uj9K1kiUF2bcCeUqvQXaC0S5Bxwr6boKc7ef/KYbhmDfqXT39Q8AWUTONt8qN9evimZjwZzGi4LcbMMeFo7SQJ2Z8RLTfy8GfvPWHgx39wiH0dxPrGLUrTdjaIBSTbM1V+RYUYX1BTLhdAmgA4hIJGWHvGahkope1jgxS3DgR0FmzTAAuWTB3GcvHMtp4dqfEzsFJ9L4F5t21ZL5kfnAeaWX2D1HLauomW7DFq6qotHEhkf702Dp/B7Hx1DGwqHVHdpwhJ4tCuc285oZsrIVCfVwJTHYnsXWUjq13VC89idopFVxAGg/l4iZYM1FjWRc4xUNh3C/fP7I90JqS5mm2J74fbLqKXhgpn2nbdE7Aawprxwgg=</Encrypted>]]>
      </text>
    </action>

    <action id="Delete">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu6gjce6Tyv1iviAgRGpfDRPYf36P1GVr467BLU2lC2N88B/TB4rYHgBn1mEUFnGpB5Nh9SFIHgxj3DoGUg07rIu1b9QlcbqU3v6AHfl96QYN7HmEdKujrIUHgT5KegJGuejcHwaMjbmulWnmUWl2uV5ujcxotD1dIo7SfNujKu2U+hKmI6D2pJeZkMRfDNQJ7AgpEZTwKpwALoFb67ghHhgRYoQtaEv0zoD52SC9jPjjKRPgAW4SeYBl9tw8l9BayCtbDfmsTtDterSN/Melik70BBaFFu8LG4SJr8IBvCQXDrM1W3dd3Ev2/V6DarSmphxsFk88MohSESLDyE+yi48McqmJn3cYrOyQbee1V6GF5M3lLLEfQSbjCxSP9ZKmYqAnDbZ3NFUmXA6wyCQi9foQFBNYnBhNuXYGam2k2gunvecGdIRvSQCZZfZCIenzbdV4hfpVrwU7C4anLvHEN3SQueS/HLWfzfUxg6V31W2VAfT7yT+3vauDkA6eZAYFSloCcODEoRDwhuhsYMS+yPrfXL8NGHMbauq37S10Cl3JZjeSNG+9lWEGauD64HitJiDTlcMTjgDmtEiDoHIBCN2xHStPr0a2bV4Se2vfz4dHA+MQds2woSN/2Iot1tJ88w==</Encrypted>]]>
      </text>
    </action>

  </response>

  <toolbar>
    <button command="New">
      <title v="Toolbar.New" e="Toolbar.New"></title>
    </button>
    <button command="View">
      <title v="Toolbar.View" e="Toolbar.View"></title>
    </button>
    <button command="Edit">
      <title v="Toolbar.Edit" e="Toolbar.Edit"></title>
    </button>
    <button command="Delete">
      <title v="Toolbar.Delete" e="Toolbar.Delete"></title>
    </button>
    <button command="Export">
      <title v="Toolbar.Export" e="Toolbar.Export"/>
    </button>
  </toolbar>

</grid>