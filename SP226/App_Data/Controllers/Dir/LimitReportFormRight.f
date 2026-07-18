<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY ScriptQueryData SYSTEM "..\Include\Javascript\QueryData.txt">

  <!ENTITY Identity "LimitReportFormRight">
]>

<dir table="sysreportright2" code="user_id, controller" order="user_id, controller" database="Sys" xmlns="urn:schemas-fast-com:data-dir">
  <title v="giới hạn quyền truy cập cho mẫu in" e="Item"></title>
  <fields>
    <field name="name" allowNulls="false" external="true" defaultValue="''" allowContain="true">
      <header v="Người sử dụng" e="User"></header>
      <items style="AutoComplete" controller="UserGroup" reference="comment" key="@@admin = 1 and admin = 0" check="@@admin = 1 and admin = 0" information="name$userinfo2.comment%l"/>
      <clientScript><![CDATA[<encrypted>%wHpQRA6PRzsPbGcovtYqZVr4G+HWtiPfn3qFvLEGpwK4rysS7c9TyjTli6jPiNR5</encrypted>]]>&Identity;<![CDATA[<encrypted>%JWaIjr4Ot6piwp4VkFjCufpYLNSPNhqieqBrlgTVGm4KVtor0lAXd0pnDBMBiJWa</encrypted>]]></clientScript>
    </field>
    <field name="comment" external="true" defaultValue="''" disabled="true" readOnly="true">
      <header v="" e=""></header>
    </field>
    <field name="user_id" isPrimaryKey="true" type="Decimal" disabled="true" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
      <items style="Numeric"></items>
    </field>

    <field name="id" external="true" defaultValue="''" inactivate="true">
      <header v="Chức năng" e="Function"></header>
    </field>
    <field name="description%l" readOnly="true" external="true" defaultValue="''">
      <header v="" e=""></header>
    </field>
    <field name="controller" isPrimaryKey="true" disabled="true" hidden="true" filterSource="Vacant">
      <header v="" e=""></header>
    </field>

    <field name="sysreportidright2" external="true" clientDefault="0" defaultValue="0" rows="331" filterSource="Tidy" categoryIndex="3">
      <header v="" e=""></header>
      <label v="Mẫu báo cáo" e="Form"></label>
      <items style="Grid" controller="LimitReportFormRightReportDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: user_id, user_id" e="String: user_id, user_id"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: controller, controller" e="String: controller, controller"></text>
        </item>
      </items>
    </field>

    <field name="sysreportformidright2" external="true" clientDefault="0" defaultValue="0" rows="331" filterSource="Tidy" categoryIndex="1">
      <header v="" e=""></header>
      <label v="Mẫu in" e="Template"></label>
      <items style="Grid" controller="LimitReportFormRightFormDetail" row="1">
        <item value="ForeignKey">
          <text v ="String: user_id, user_id" e="String: user_id, user_id"></text>
        </item>
        <item value="ForeignKey">
          <text v ="String: controller, controller" e="String: controller, controller"></text>
        </item>
      </items>
    </field>
  </fields>

  <views>
    <view id="Dir" height="391">
      <item value="120, 25, 75, 100, 433"/>
      <item value="11010: [name].Label, [name], [comment]"/>
      <item value="11010: [id].Label, [id], [description%l]"/>

      <item value="1: [sysreportformidright2]"/>
      <item value="1: [sysreportidright2]"/>

      <categories>
        <category index="1" columns="769" anchor="1">
          <header v="Chi tiết" e="Template"/>
        </category>
        <category index="3" columns="769" anchor="1">
          <header v="Mẫu báo cáo" e="Form"/>
        </category>

      </categories>

    </view>
  </views>

  <commands>
    <command event="Created">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2xlK8qHzvkvVP8ToujfaeunrDzIlMODk0ff78ePL1Gr</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERs0p6dcnuPXrUK0px7eCfKbiSjkFcI/ngXr3ppv1QXEi2tpnJO5inih2V+LNg0rYvg==</encrypted>]]>
      </text>
    </command>

    <command event="Loading">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2n4f7jl0jX8hzbsWRhvYc+On9S5oefEl6iw4NanziAh</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERlvcouWns0SGgl5VrtX9WWjhE2YcK4F2mh5USgAgzVIaYzmqolpkzFAe6zQ179tuig==</encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gfwSZFYAj65RYzXb1/jCQS7LbKpA54gCakU+hnjiXOE3L</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERnB2QfgI9Z5UkitrgSYTaLJTp3XTXSG+LWe4NVZVk6V074hXru0/MZIF7Nc5t/steQ==</encrypted>]]>
      </text>
    </command>

    <command event="Declare">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6VvCSBXw+wNCmCS5yYrhlbSaO2S1WV64dNcXidN+Mi1WaN8MSyJECa5wYt3cvTqaI2DZfPG6sRPqn6NK+08Y8+xAO1cH0H2vpGKmXj8G1LJ1yqU/mQJ11CSmuFXuuMzDVUqBN9Cgn5TavmwrI56t4ZNpmW0eaTWya/6U+omxRWL1SiRhAryJFZDFCmzgL0H9xvJNWxl4SuSd5DEKATm6uE5LWa7oUio27laT6vFoqa19Rfi/HlTh6qps6cOJOxQ9DQA8lTdmkP1/h7B6RtvTByGp91YF6yyMTqk9yk3J11GlZhqvC5NM/dGRWaeW01ri3BZY854X7xcfmv5r18rCKSISaZPcGeoxi5GzuupoGDvfqUSyjIiyf8m/tVLdCNbARV8+9P2lxr3CvBkH+dIgdkxD0hAujBJ1SnDJOf18jwfV</encrypted>]]>
      </text>
    </command>

    <command event="InitExternalFields">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf1DvqYPEGhvkhcFFLA0md0CtoQm01wAdVF0idhKMueuLxpqGtzqnHVEnSp4Gh35I3J4KQE5pAjQVQqcbg9IH1ArBHCXWRWuHVqTGD24+JQD8ip2bw4nNTWJ/JMFJK37WPD+GeSpV0ej9KKdZtuFNcYBV1tP1X8r7L862b04KUqtj</encrypted>]]>
      </text>
    </command>

    <command event="Inserting">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzJXabelzac6jVOUXSFCLtuGyd9RUKQsBlTKorJLaLWIaLocDfyWkNISkZGU6g3joAgsJ/jup9hjs1pTaw51grl+h/S/zfUlqLcroUZvAWWMMfOOXC3KLokhs94aIBFtooqzs6GLVl3qEYy2cx8AlibI0E/ScvRO0O2kxOas3YVBJgzQPXVC1iKW/VfxPrgzFHIGvR9hBAw33GJOj3tHYWPZyqZCzNtVRLgOUZpRAEw2+qWbHnqfyfDdfJjz1gBRzI8=</encrypted>]]>
      </text>
    </command>

    <command event="Inserted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6eUAIr4pSju0cHfS4o8vb5yz8L6Qk2tq+6SPYWyTY+Ahn1McblGPqCzcudoSmUEshRp5HrBhd1/Oj9JE6lAAQ0yiMNEni+IfQExKc1WTtr8TbGXw5P0suBu8wP+374VGl1NnHTtn6Qn+py6yg0otfgK6V0tsrZEqXp1nSFakSrtnofvtMVho93rzJbaS6Wolmw==</encrypted>]]>
      </text>
    </command>

    <command event="Updating">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf2FwRxVRdbmVu5HNSCp5ZzLZxosfPAOt9ojKQB33X0vUnQSR+N0NmPuCvRj3JFiiHVcIJj/DrAw/+08VD9fdy7nYfnLHFS3uiVQWo+isvPF53do5C8USFx+EMq4PyjsLqVB7sjFdugRQo+BewUTtoTkJq1d6HxI5Zo6ha9Qc3gZYI39X0qqqjmMBtnK9cqcfdVZCqVfjO7dgNF52mpwIrn2KEsIzVP1XPuhthhbXcKhsHfpn1fUe6evnCmyroO6sDkzkrqSgB7hNV3Aca5VxkvRFRETQa/98fyn2CzOOGGU0UtYs0KACg0eTOXGlqwinPY/v5G0WVQZfCoxeqwIQ8IIcv6AyF+hfDmu/X1o3UO7uyjyOkEbvATsrc2tO7z2EvHN20ZWIbHgZ0X2x4P+dz+Ui5qiw8ZrXO8/xa2AdhlN9aPdOCDkfUjGtv1uKCK9FPaHSm9Kb/u8witPO+jDhCakRUKURdhhVj0dlU+/asfpKja4tSTxqnCQSy4JMimtZgw==</encrypted>]]>
      </text>
    </command>

    <command event="Updated">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6XywftI0wqcSBylT7TPC7ogm7xr42354wUsuD7J9STjlPZH3j8Ye5eELAS0GTHkbemjKxazl0ojg/aF/1fTRqXbt4ST8ksHrOF0FEnU1JxsCJzsNgjWktop10oLP/JZ2f7rqwamXxAES74ydSThvaVgSEMPN7796lTZwR0UBHxoCI8mrWmiv8nyhtPKUQ7E9jHpj8eFjJ/KzXYHJyLyWiTIRUJ7DAjBz8JHFZdeIk4ZhGI1ungekh9zOnsEA6lJIdJ2aX8mDwI3T7jfjCu2m1v5ffK1AYJ5NK9QtrQuOwkEi</encrypted>]]>
      </text>
    </command>

    <command event="Deleted">
      <text>
        <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6fo87kgswXV50IEvcG7HYoX0AnbQrrdVI/re7wD+etQETXz32UO3eixcgz5MHofGnNsmwxIix/A0HlVGTF/FrwW01PJSqn2c09nzo2GbhAcVY+w/iwpAgPxZ4nO5Sj0XYboBBbnt2aQd81DK6sBT/ctt102+C0eKjcQ79P5RKni0</encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70OlhMzIHz1eI5IxL4pZUp08vmqEGXbQVNR4BB/ZkQ97wCMbL990bZ9gc3DHgLnKdXb7zCR9t6a9LeDOhr7R1GPKWULUG4sPpP/PCwU4soJ3kcsMXPxBum48lKbWmOaXFkXgjhpbWh5JMmNkTSs9auA8Si50j6aM/o8kvQZpj/1T+R6TL3+EfZ3UDxQMpgGfztRZEpkHOPx0HO3isWOqk0nmQAExrzdED6t1WtVh00uD5yx+FfzwEL0GBJVOw0DqDp6NDG5AuSQI6RCb+F9ewRqnILhLxDL4KqI8q81DrEmYeMQMHozt9rKK0yDx0OMgKyM1eLgrdKxYa8UnJYJgfv3Dxlt7d4yPaotlUe5woj9lJprpCFaAOLcN4Cuv3GflEygCZDst1x+rgUsEnW9PV4Zy40mCHwYKVJnUN1VKYAaW2DrdBx32qGwXCq/pAFSDdXXdqELkijyQxs4u+uD5oaYH4XAcvzCC+2jhGprTHJWLMnuM+dwxSA83KQ15u4b0r/A==</encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &ScriptQueryData;
      <![CDATA[<encrypted>%24U0NVrwptuJiahRI7m70MgU3L9MV51GLhAC5KldzdIJNZ9RTQ5cy/QV/Zj/O55L</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERkvVt5dAGEhDbMW9rYuVPVdHjNXO0ncjVMh8IuZ3KbH6aHQU2iYab7FR1Eoz4I25TgaGZjWJfODOaxSVNim1gnf+9v2L9gZoyC2vDfH7K2mOMQCqvzfYFcZft77boxFs0fzIlcy40Z9NfT6wFKIpEfSTDH9ZGVEsaS00BrQlUpQ3</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERiNTheL4BRNBxVGNvEewTT71bJHeK4kgB1qFV7N0KGidP+TUoAXWyNcNEv/GXsTGCw==</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfNrUrAiffDy1/u4VVqG34lZOpTx8QxHmPNkLj1WKlQ88J3AtKVxpQRBYBmCoXEnhdr+HR5GbKcfpAuQ2jADZM0AGkVa2BfEVQgxsqfNcdAZk</encrypted>]]>&Identity;<![CDATA[<encrypted>%CDCL70aV248WeHYwZepdV41I1P3VXmn8juZCb3ZX1sVC7+i+oUkaUj5xNY2npyGSt9oCq/dIWoYwe+iXVqahhjrYPm/D1FNYmVoiJ0eI0hDtgJWtkHSibwWImsl9sAhWKWvW2njwdc1vsZBKW/6ChQ==</encrypted>]]>&Identity;<![CDATA[<encrypted>%MM+rOgNyJSEWR6VShEWERmnwi1NOrqbpFugNfNXnMf7cKLQrYiZ4nUVtpBIXOerNN2pl42NMDYOp81wn+OlnoJgYRLJapkhqAvhbcURyc8XxsvFsslEA6QYUJDzW8p+k</encrypted>]]>&Identity;<![CDATA[<encrypted>%CDCL70aV248WeHYwZepdVwPjuR2tPLL3XPdIAC+PMFLuRp+ZmjJI4iyO8eJTaHnPYK0tqUWn9aUgy6zGuFUsrjTqNw/f3qAwbYg8mNxbpYo=</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfIeVkwsumXazuM4SZLvv/LSEz3jHE37iO+o3sAzM85divk+/9oA0W2I30mSXtUZMPj5alvJo4qfC5gLBlPmMcWc=</encrypted>]]>&Identity;<![CDATA[<encrypted>%aH9MzbbYhyI/7lu2xgP57PMJ5q3h8ieTmpE3DUpZ0JJrl271BxLHf52fN6SxWJXDQ9MyhcwZScyBE3igOTJMx+lmID3Ugwbmafn+SUR4Mq7tu7ElA3M3eSbAZOJM3azwtxRNYCtC+di0sV4MlhODxtZqPRlK5BVaTHcwLoc6WEE=</encrypted>]]>&Identity;<![CDATA[<encrypted>%JWaIjr4Ot6piwp4VkFjCuYpIEuGcY+eARublymnYJGxMMbRnG0Xk8dZAbUbnftGJD6X22jFw3a8U8+Dui5DS5eZqopxzIdqbT9P5SiZihqmUgrfwgGa/YLsNc68wBr8i</encrypted>]]>&Identity;<![CDATA[<encrypted>%rtKs3HO4ubXr6fq46WIrfCP296pKBalKUNxwEp9xtIUOVoLDXukVs3aJx6k42PvkPJ07oj/kAY2/EgYfXsncdPRw7yuIrLDhK5G4xXEgSDwqz3yhbRj9AW0C6RDC0mRqATAARVaVKhhhiuLX/XE50Wfs//1pW/0Ch7i2M/SbCp9f3Bp1mrscw7lnny7kdJ/ZXTjm/qNUasKt2qKlwWOYRlV0FTC7r+PHmEZ8kmRrVYlgql3rNpFegtcw9jF/KsXV</encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetUserID">
      <text>
        <![CDATA[<encrypted>%YvlSy6jSv+C7m6Bhga3gf6N6bZd6aqVn6AqjRiAHuK4t5w2+icxkb4kqyHqVMqntNnUgeUpd5+2P86AipOFoZSSHVe9urXHKUF/tsb9a1bF/ktB+skylIKj6EnOnQ+JoO+PQlfssr6j+W2geFuBpp4d9qdT4BaVpBpAxscnN+BQ=</encrypted>]]>
      </text>
    </action>
  </response>

  <css>
    <text>
      <![CDATA[<encrypted>%cJCtoLktgniwoIibGiqL6bRVyGVSO6Z9ow9FLIFYSz1DyNnoPLt5+FiEUX/ktBzxQILRaEmFEfMWjXDh1nHEs9l5bnXvrrl/KkCUqbqiupkDLMjNVYlF76ahXBBnZXvadTOl15IzDDjj1EStxt9hIZandPbNy+IgSUAP0FRxf8K2BPbwKid3SeOz/dPFm8F5/zEaQY7o9LGxYqVG21sdEhfxwdKrfP8l+ELyFgnTYr3P0ZY3Nk2xcxjnJLToRqQN</encrypted>]]>
    </text>
  </css>
</dir>