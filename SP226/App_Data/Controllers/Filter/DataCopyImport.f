<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\TransferField.txt">
  <!ENTITY TransferID "DataCopy">
  <!ENTITY Key "declare @rk varchar(16)
select @rk = rkey from @@sysDatabaseName..userinfo2 where id = @@userID">
]>

<dir type="Report" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Tải lên" e="Upload"></title>

  <fields>
    &UploadField;
    <field name="ma_so" allowNulls="false" maxLength="32" dataFormatString="@upperCaseFormat">
      <header v="Mã số" e="Authentication Code"></header>
      <items style="Mask"/>
    </field>
    <field name="cpass" external="true" defaultValue="''">
      <header v="Xác nhận mật khẩu" e="Confirm Password"></header>
      <clientScript><![CDATA[<encrypted>%/SjCqBsXcIoqRaqcL3p1ts36golF8ur4r4Qnq6lRtP54A/TO8+IhxKKSrJaa0jLcRieALvWBWlyLr1bLjaPKs5H4Qan1pRacha+0zGkHkec=</encrypted>]]></clientScript>
    </field>
    <field name="chkpass" type="Int32" external="true" defaultValue="0" allowContain="true" inactivate="true">
      <header v="" e=""></header>
      <items style="Numeric"/>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30"/>
      <item value="1100010: [upload].Label, [upload], [upload].Description"/>
      <item value="11000: [ma_so].Label, [ma_so]"/>
      <item value="1100---1: [cpass].Label, [cpass], [chkpass]"/>
    </view>
  </views>

  <commands>
    <command event="Showing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxSgbBAs+XmXw/t0aAMaVjSd9fke7BXR8vUWnmflF40zqBOoHL4MZYX5EZyAhmExoZfggLH2xR82FqgjNgaHKyc=</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfxJzD7iZDAI0Eolezug6/efVWfjQzeJKsYj86kb8RFlgJ7JdMw7hJYvar86gMm9YYqdPeIP4UxTeAwqtNvNZ6DUiBzJFAtipcGjmOv5jm3p0</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf7XS+1q6xKoE6fxfv1CjspxCh6wEQKIfgycGn5NFz5nP5eooya2pYsIqCmYw42s4fpaS0XqxWcOa/qksLU3VZUo=</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70IHhFGQ/mCV8ODWPgRTLeLlxM6l42w2i/QbzpoLVZJt3EqZe6UxAI08WJHbwutkp4jijVFxUBIUnEgmGUAVCQ4sS7kQmS7ZnpwkcoFpWKZerShBb/ltYhSlywHictK6DxV0cyh30gWFtWeQOoawdMJU8EgRkPJTPiaFWAIfBRGm0ZKgOPceroebfAta8eiw+UJgP7W+H71i47csrK3T4kZDTNfp4SG0800VDJcPL6laaHanrCizibHOxSuIYoG1Xtic72SEMCWWe9LJVakpDgLB27ivIajfWbAqKUiQYERfFdCABl8HyVzh8pJDio9OV8Rv79k4FRGfOrUKqz/7pnkAwqpfBWV/RoLoILc2TKQukinHzqGTTOm4Rr2dX4MocqdzRfSnogSwal3urmMpusfSPvaiauecQc0piK5RGJCQh0KW5MuBpOeOVUMtucBqiDOe+aOqZxd2YzdECOfkqbPDz+u9oDLBbhtL9dF0JxYWfG/CUnwclty+J91iKRRcdeCd05fN4N9TG62vYENenfbU=</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70BcWFv9N2Or9rvrs3U1r7fn/kImPwpyItqAQyyH9Q0UUQIoosU5vXJYK0UVuBHmYaqi36yc+hhlypYuvCQKFGgQYuta5tGnpblyRYGHvPbVE+x5pFMk9Pgcaa1ytxr+2ba3dWsH7FHEzRltEi89JvKMpWJssl1nzHhbC9EpYpLpwjDWvdAelKGBpAqUYCyan5iMQubT/YFmKpxSW52WaTBYMHa1fMyLOjnQRAB4zTJ46l0y405Zysmsm98OK/Y2FXRVvOBo+oy45uZ7E2W99hZIUhRWYgEslxU8CFi6Uc20u4pu9/26rTz2GpZ1ehi0cL8FbEhJuD2rDxcLOVQnOweQiYJoqQz+QMtg0QyQJogkiQRPEpidp6Cj1YNxwHUKjDc6mh6kH7gTKb4YUPtIUSmXgLuKLnOiek+dCJ+7lu96P7XOoRQujUsR3i2RvWWRRevXPuPZItgG6gmhnbPNzdaYbAfoOwzDtJbrc6PC5Xk1UOxMxqmc87Uo9iH+RHV+ZOMlkHauOzynbE/KQH6BibGVh+Nqb0Xg+hmU/U+m2WoHPbaIkxoEdXamBUMUMd2Fhgtqy3yXZZGHaRJMRW917clp+Y/W9at4mBUkU34qGINZebyQiSEvU1f39ZqovkZCdnyl99azYimAnlYbB6T61cPhKiiDZLD2U9txH8iC9H0XD72FfaxC6ydkC01O00myRcbuFCzbVSV3QL/Konw1a3rOgTJhSRswJfWTd0DzOSWAoju5aQWqzBlt+Irxj+QcH+8YaxbjNXM3regKB4B9hogLW/DQFoddz9kwCZ4Kdqe1SUNo9K9m1AylEju6CYPHbBeeebTHILGpY2Fj5BTIe/c16hc0bs4+2Oen0XWepsmspQ7CUU5cifHQ2Tt0AaGBLD2D2Is7C5dAtI5F7Ct8ecfebu7jTQ00fhlQKrnZTP5qMDc1Nh3zCjOjH7//Ad5UZmiGqU1OQ2bQ6S4DkXz/z/pIagDj7ei4trQEuTjqINt8RHmJt7TwXqLHGh2Rvz6PRq1aoLo430i7AqqdON/2OXVxt8QGYGHClPTzpILOlo+0CL3Lmvb8s1QRt8C3Fo6AKV1oUHAEFXADnHjLAjKgkVzas2yNQ5zdJHZqAgnantM08IJgkDBZwyzHQri0Yl6W4uZg4kdXJJSxTPMBNjWrjCxcT6/nnrPtQyiX7+W9rZuwVCQbRL+1obdsemrlUf+DKJid0aqfKgoroRwov1Wpx1SBY4eZvcG3O1OOtJgt6mkN6GKaBt0vtw4vfpFS2cOPz7GqUStBo4COsNzpTGRZG2gG1d4PJP7N0ERVpLS7qQ8Z0UgkLa1jLcnMUfO7+ICdpmaSSnqq4TAytnA5Wu8Apdadrurf6ul1NRP+5B8HuzL7iNRBMZHRbR4tOwDfMQGWbqzHuvqKiyqEqeBa7HxSgQdC1ALYOzXAvGW06QS21hF4uZtowi5zTKcGNIiTYQtVH19eZdA5xOSLpoHMwBQ7PXkkSLuML3StD+uUrgyOhLx6g1oJWRG/Sx1rvGnaufac1CPL5x3vlFUoKo91eeY3Wx5sIUwrJLjnTiI4tW7PIqPrucQDLptL1/sjtn5TNekq8p1U9dj2BS5GRK7lpBKSZ09iBX9D7tCZ+T1nWoIYM84pBdOWKNWLiOsKWiXWMvNRCRqx9+RqV8LudyCm+trNEPe4PuYIelkYwJ5ZlG3lCDv6ha4tlc+TlPp1BLdEprn4U1soA5K7DAmaekZX2NHttV7xMQZx+d1c5rSz2bktc2+FF1aCPXbcD2B/xN3a2V2vXbCIRCAeKIIWKafX3jgMBnkY=</encrypted>]]>&TransferID;<![CDATA[<encrypted>%yLooQnL9xQeLYF/0lD7Rzl8e2a2XtLZErOdLQRenDxaDWHrl0ZMqXjoozgrV3TzTmCV8l96USQxDJruK5FH4Wt8ahYaBQ9M0bzJhi81KrjTWuSihbYW+Bs+bQBHngYXjNarOvf/Us0aUOVj7IXl5q8R9jNP344RfuHkR4CupwtIWplw78Y9c6UH4qTG7ZvRl45I8hCop8c9xXbzJRUG7l7m7WTJgSoLbhikogvNxJITXjtcDVAITMGUZYM8CXxQE8NEzqmeyuS16uzmOj2BHUHy3tiMGOy/l3JjSudjxq49QA5f8sVgs1scmo7TLA1RSqUPerZJk8Y1/naLB9t1GHGukyH1k/0RSKVtzisIFOt3dmU9rWym9sp/328TojzoZ6tmIf7k0jyCqpOeOWn41uWOahCOBtNx53C7zQKr1HBFW38pOejBgs3ECnaqiD9Kl</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="Upload">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fy6sUzURmsO5tjzZvhg2qWduJUsyX/wPtoVh4ZB/IPWhBBfNkw6tmXibVQjMZuVyTYfgn7Ea70y+OTJ/0E3+fnwq4HTNbwotLEslcRFrvU6njHPLYIfXc6F5Q9Yz1mb622A4EvOqOwP/5b+CJ4AjPn2Tr138kDI+USzZjvgf4L70WFM3/xz5JkqH8dxBB0bZhQiY2RzpdGjHzHVZVzcXTjNb3yydLOU1if6Q1tOfr/6kujfNj2HZ5oQxZI31sIe7dndCZ3+QVKWQmi3dtY+h8k6FTvXi6XIh07r5ePQ0BWm88y8L3scpHHWlPKIxFHafaXSzbP/OFC4ACJ8KGPhQBOL+LCel137fPr/Yb7Ot1CV2qTqpgyad6Z31roOtKNyFA==</encrypted>]]>'&TransferID;'<![CDATA[<encrypted>%fwt9cjxAdHhyb9nGJbndnNqL0OXdZ06cuW2mm5mIWgyVbfBOfOFYS0/hspW6igWUbQeP+1gXSAn4AsZSpB2H1iO4iaDiQwIQ5tTCOcOU7PUD6UGhZEB727KDUa9BbnBACxT7omt/WoFxNrZEwuLmbT0OwkeYb6AKDGMqpOR9AqI=</encrypted>]]>
      </text>
    </action>

    <action id="Key">
      <text>
        &Key;<![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf5cBdf+Y6fnghL241kyDz6YVX/jV68KjRqPZfYObLs198eJ7N163RjkeuXcCXYvGag==</encrypted>]]>
      </text>
    </action>

    <action id="CheckKey">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fItCfd1XXCUKgCP18muw0gx3W6dMAOelI5pTk4UrnWkD1r/vFI732v7WtX/RuPqd6CuIWT7ndfc5zx8xIhb+Lq9Qz+zhNCkOFGLcltsCKQOhPwDGQVkHntl/qVPom3RTzQlKBomxVQEq+LJArPGEc3ugvcMcxBxg9uFnTiFdSGk/2gG8/LI8tPWB909tgMeJQ==</encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>