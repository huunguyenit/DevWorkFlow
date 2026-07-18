<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE dir [
  <!ENTITY ScriptIrregular SYSTEM "..\Include\Javascript\Irregular.txt">
]>

<dir table="dmquyen" code="loai_duyet, ma_quyen" order="loai_duyet, ma_quyen" xmlns="urn:schemas-fast-com:data-dir">
  <title v="quyền duyệt" e="Approval Roles"></title>
  <fields>
    <field name="loai_duyet" isPrimaryKey="true" readOnly="true" hidden="true">
      <header v="" e=""></header>
    </field>
    <field name="ma_quyen" isPrimaryKey="true" dataFormatString="@upperCaseFormat" allowNulls="false">
      <header v="Mã quyền" e="Code"></header>
      <items style="Mask"/>
    </field>
    <field name="ten_quyen" allowNulls="false">
      <header v="Tên quyền" e="Description"></header>
    </field>
    <field name="ten_quyen2">
      <header v="Tên khác" e="Other Name"></header>
    </field>
    <field name="dmquyenct" allowNulls="false" external="true" clientDefault="0" defaultValue="0" rows="266" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Chi tiết quyền" e="Approval Roles Detail"></label >
      <items style="Grid" controller="ApprovalRolesDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: ma_quyen, ma_quyen" e="String: ma_quyen, ma_quyen"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: loai_duyet, loai_duyet" e="String: loai_duyet, loai_duyet"></text>
        </item>
      </items>
    </field>

    <field name="status" dataFormatString="0, 1" clientDefault="1" align="right" inactivate="true" categoryIndex="-1">
      <header v="Trạng thái" e="Status"></header>
      <footer v="1 - Còn sử dụng, 0 - Không còn sử dụng" e="1 - Active, 0 - Inactive"></footer>
      <items style="Mask"/>
    </field>
  </fields>

  <views>
    <view id="Dir" height="326" anchor="4">
      <item value="100, 30, 70, 100, 453"/>
      <item value="110--1: [ma_quyen].Label, [ma_quyen], [loai_duyet]"/>
      <item value="11000: [ten_quyen].Label, [ten_quyen]"/>
      <item value="11000: [ten_quyen2].Label, [ten_quyen2]"/>
      <item value="1: [dmquyenct]"/>
      <item value="11100: [status].Label, [status], [status].Description"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Detail"/>
        </category>
      </categories>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDHwyWdnnAsOePGxNOFkX1fSphnMYzNzchatku7wNGVjum6IkggtE2Hm7Bm3stpMkDRJqP7seEizsMjKmHjuZ4E=</Encrypted>]]>
      </text>
    </command>

    <command event="Scattering">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDk7V+WCQCbTf5mLypqZov9A99ytSwwspgJ+9Lsth+iAl0cJNiEb2dF2QpQDT/cSsGAj2MzmeDOscDvanTlXMQodx9cOO8Z15BHdnJJ+9yqD</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcBYezWCrEMH1fHatEHfnpcc9fDnsDTiOrew4Ph/8Q/pOSHpDe+ZzuXkYuFrE/UKxWk+kxTY/CnqB30dSscLtMA4=</Encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMuz/Y5C4Hib64R6fQZYNBXq2IFUTeYgCI+m73yMqsqvhVfK/NCPDhMSW1bAIXdU+QckZVgeFDw1lvwzbW4aQLPjIwaS6ACvBtbFKkH8K44onDq//wP9L6RECYZlDoAlCwfOUGHFll+gIMQ8mqjrVnfW597/0tFQErN2FRSG6hAnsCi9XoJsQiGXjv4IN3mJS/nm4eywPclIk74A2OH5UMZS8atekmmZkCMgVKfBOEfBbWHVWTczQwQcAvN0llIdUZRzO+iYjp8sQLK45P+JZHN2BDDVYTW6isMSi3wcbEtUZCDS19mYMNnH5Q7uijpKX927t8BVeYpTmW+c9L+2MZYcgRp64TN03RgpHZ+Gb8OX9bIlFlC3Qg8JO9VYS1E1Otz3Uz4GOLAMIUc1WunQL+ywebI2CHnO9DcRhFUr7ham+aZfGpJndOVY/7hMvbudZ5iDhafe22zl5qnc0KdjUa9SvH4DzgIrXA5vI19zkPPCTINS99iCKmLnklJCBT3/HsY4LvnycF/6XHK7dcJJ/NqjIkQCveRclKTO1zNFYU9M7MI4Ow40D0XNZdVGgSCYk65QwLCwtQ5g/hlF6mayYnFgY=</Encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcN2JKxKAnBFch6SwKc9HgayuYbj8YcwZjqrfsqeBUDwUoHpiwUE8gKYV+tD2zMqvS+nRIuHho4cXefASSJWbosoBjK4495O5PcYEbWXrKGBv+CYocgUhuc36SmVWYneqC2KouRPntZhY3J3NKjp08RlD6SVq1xnPuHLeWsyHVkqvhcoiHx++m4+nw0K53dSCrw6qdVDG71WcI8FPDGfYWHtU1FRdFsXEYnkigujazL23sKXiEaS5CPj6z3Av/JtY0uTLvX1fkOGTsOwdrzJLOKfGfDsAc1OUGvgkDjs+K0+rAk5qZdtO60lvQImzcDc6Jg==</Encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcE5ncFUVCqvPE99RcwTqQ5r0RyFHWd9FRT9zU9Cn4PwlgDNnTwT/VYCHhKP1b13avQ==</Encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcDPCXOqUAunsmwf/K+O3yp8Ubfvq2dXTvAvl4Z841iZLN/Hc3cuxwrgSOy29svtw1KIPl61DmAUCiPIyPh25eYpMrvlSQDA5P86Auu1gLO96msY4G/RNhcLJFCLg/zfu7m4VsTHqdbjKL5pu9fi8nyFLUqO/ZfRnSJllH9NysOvgy0COQto399L8Ucv3CKKXtu8FDFuyl90T16o/H8sc9L6ZZ3vR0CxE3iSgJRLp0yC7VYIo/Y6qd/MH3ka8xHmdnhfcwLE9e9C4M+kg9wGxB2MSwpEVOKqGz38ZXz0Kco66ixPs9Vx4gVzlpfhvH0C5Fc7WBpG2j1qepq1EdRxLECm9DbaYMO5mJVWAs8gjDDw/Tv5EdsXE0fAGZoINY9SqoG0cp8+3z67I4Pi7Sj1llq0X7a1qy6e6hNFzWCZGYQ1eKbIZXlxrbZkCY+RS5NbYGA==</Encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcOtYuxYRU62nEQUVqVct+aLLwna2LuZOA1m4xSNrQRASml9LvyPb9u3dzA3Z9lPEbVUP8PsZaKTpEendCy1meoB3Fak6NdsVkEC3adLB9CPmfK8oFRcQPShENMOTJseAw0TFgsbTtweSmuWDdhTt8033wYuVkjI94RIeVLudL0/OlQyGejwQIVgsRdVdYEfzFLY856zufcVOD7Tbcych/3I=</Encrypted>]]>
      </text>
    </command>

    <command event="Deleting">
      <text>
        <![CDATA[<Encrypted>&mESLYKUGR/20AFH6ZrQMu5fRrXlSCGizjtcyvb8ck60Q94QwyJoTrKXzsGzzkj2vOlKAveGUTbaPbyu3/Byw8xGmZIeJHT8U/xGAnqDOslg=</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&irH/Guq+c+xo5Lumk85DTLuRqas6Nx6jSt96pJBFnPKbJf62Mkx6gW94sMGKFMUBRrRAfg6bM1wdyzJ56mT9PphN3/F2gybBANjBUVL6sONA6bqfnCa/V2KEZRXgaRok4pEOBydf/5xQh3gsLO28yw+d+7J2BFM62wTb9HqLU+P4Lnvn/ksaaBJnI3Qi5XrCMplRLLYS0SYJMEPk1A8alZdaLanegN7G9cAiTBVUSlnjLI8UoYE8nZNYadcTgMmkoLmx72Bv4DQ9dFLWe1ZOzq6i2nt6YOBAsIdfAzwNUfxogZPSndh/aX7IoAOeQ5rM+IwW6G43J52SuEEDhELJgTQ9Yh4K6RO0KcH92vzBp6wSSVYATGhrYod6v2Yf3csSGBRe3R+hw6KchaxTCUSrlVpxL235Aknk5cBLWzDc0RgB/FRI25lDRNwaphKoRgf+A/4eIuBS7CjGT59wCyjPdlJvNEvKX3+ABsgvLkDO98AO2O9Lck6qtDRJybRnaKerCPc99Y0LYndrvubDS6AP/Drro/ZLxjlVLsoVgvSP62Cj4ZjGvHi3n5Rf1z15TQ+R1DP9KGrdsIIm+CCL6q5o4G5cw2wN1fMiHUmmlsPEDkSIj+GrRFvdHOzmzhBU4RuY8fkNNn7iiqzESPp4uqmU8D9wpMegf3Muqx7KHQ7/3rcQuWIA6xKawXYAEiAyYb9HdCRvcjhoRRIFCAxSmZS/AJT3fAsBbFc9/Bl1oftIXMoiC1s4paK5A44H/bFPplsH+AgpcsF22TqjYPftQAmkXA==</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      <![CDATA[<Encrypted>&urCjYVIWi8oLG4/CqhNJtScvouYEOhqvZto2W3YxSGML1UwCUvNEkcUYsuustl361GnK2KjZFkkfxMnBNIo0aUW1F5nRaWBhCz7A8nyPfTAgElAhrD6WsJ3DQZe6U3sjQQIueEy+dX5NdE7pGtbKkgpp5DGFDJcJNEtoX7QwN+a2bKgEO3revbnKaRNv680sAZc5/K3Fv/TWiPzqmC8ZC156Zkmym/hbqJMUijY63d3KMntcjkSbyhEhneTcx0/EJ/dlcgoBib/3wdfRIDSPogPrzO9oYNSDSTS7JleGcCd6eYcoxL92onO6jM85hZupdy9EKqJxhCTfonOXNaVZ6kmV4VbUnEVrVptYa4rLgpGFpOtt/LcsUDvC1d6tYKFOwbL+jVRXFZF2QvSaP7dWiRaI/ykc9kTWB0OA1KAqEwZ/G2Q6NelRK/ZtkD2gFJkidr7k0ixvv9O+i2l8E44PhbQRJjlK/GoO/dMGQfT+ptMdfItRLoL5VlVMIKupXUkIQE/vaZdtk8bLVgJeUsH36oLanwGWgy45GcG2iN4NTfY=</Encrypted>]]>
      &ScriptIrregular;
    </text>
  </script>
</dir>