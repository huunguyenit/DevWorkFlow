<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "DDDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
  <!ENTITY % UserDefinedImport SYSTEM "..\Include\Javascript\UserDefinedImport.ent">
  %UserDefinedImport;
]>

<dir table="m53$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
  <title v="Lấy dữ liệu từ tệp" e="Import Data From File"></title>

  <fields>
    &UploadField;
    <field name="ticket" hidden="true" readOnly="true">
      <header v="" e=""></header>
    </field>
  </fields>

  <views>
    <view id="Dir">
      <item value="120, 30, 70, 100, 100, 100, 30, 0"/>
      <item value="11000101: [upload].Label, [upload], [upload].Description, [ticket]"/>
    </view>
  </views>

  <commands>
    <command event="Loading">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcHN1GSsozC3W9y8ZZfl+gb88srNhfWfSmWqcvCRR7c8tQ554J/eiIcQgJbyV15/n1Q==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Closing">
      <text>
        <![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcCLjOzEBOw7WLxwsZmNVIhdyKUhv/DDvGaGbpwHJkbqg</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&GeZsnOL1A2iQT92BjpuQuo0eS5b8e+DofV8FmhQ8f5+a3+Ekd+oxpqkqpDJ7hyMpfe1mwKYr3xhUriBcXoM1kw==</Encrypted>]]>
      </text>
    </command>

    <command event="Checking">
      <text>
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKaBUrspbPJs/UZF6A52n4PVYgDw3m/NJQkimjLqjQLz6jMSkPrYRwfqBpNJX5Rt2L4n90eXvudY6o5AQDPIZe81Be2HkLmSFbFRg2eqw9sBmBvxTyZTSYeaxJQwt09Ow==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3pzmE5chSLTUsRU/oQi8qvIvTBRzoIephrRkZtXbFyoIrBELwMw5+m6gUxWzpcVL2LHh/Sf1f1lPH0Mj8Cye+hD09y4FXRK7ap20f9QmL5AO810cPdM2uWBYyrwSvlS82/xE2g4u3L2w2Ymt+UsTCJ1YC+JC9A75+/qZ9F3aMcTTQ4Hy9V/Yqa5WTNlSYRsDJEs2K/jwlz58xleu43D8MVndr0nz82BpyLXglSLy9zKHvjv5WL4Jmlt1fqCB1oQLPLvEgaOC0DqmR544CSoUSrxrCh/9zxaqENYSH3SAOFyYcWBquKvYi+9o+BVxtjvB52l2E9365HF0xX0lREpSuGybNMUyWTQndoC+68K2xcnzFshCQV/lvIuqPyC3+Uf1Rg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&C2oX7For6o4fC973pcIHelHwvPk9nrF5yAaoE7lP7CdE31r59JFoWuQLo9Nv+ie4UyHbkkMWI1mWb/dsH44qTKRB/EJWNopejUwt7/l37AeTzy5fiAY7HIa28CYWQVU8V19FBzuC3yZGjgxH4B8WmnFZd0tDZOM40HFGkaYInuLfhxya5rlHDtkwvMLdpjEYVV1b2DvSpMEJ1HDxKaE8qT9Dn7tWR65OlpYJt+rKYdTizeHnaGud3FG/L+i4wzh8</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&40Tg4Lrc/5UuRfmdgw9mHE2LfCeI0QcWQ2XR/cdsKh/W27rMVDvboqUE06uy5BVkc3o/XsvdgoUG9c81dgNEYGPMEdJjH+HnB0skPC17nxF8CfF93DbV4YAtf9iIUoDaLvLd+mHQQ+IeWXZe2ANJdBfxYx0LYDaa2oyJUF7BPPdht1kG6x7r+7l0KM02lD9SdQ9P3KevhkEzD1E7PGhokmDR0X/i0kk9BcYZ0vR8Tf7mToRfwGZxxZ8rSMKi4SRGeyQUC4kOyYgaxF4LjYgyYjTOfwvzaEES6O1YqYr3wg88l9rwMTzmY7Yd+9VozfsMNXuYM+jKdTM2o/Pyh6tjfMYy4+E9Ha2G84z54ClHGg7l91vVnWmxfGM8zKeirHn2a0QSbIFSW4j4+QkGf6oqDoKcJBtedfu2gZ2Gla08GmntKskhElAFS4O3tyaSUaAWTsinCWcPY4WjJ+b287QOnSIAzWvgf1eE2elxte9+63kdc9a/MfUJlfLcqY5xIHNUh92swPJrTjairCWjTpcCUwRluIegcu/sPvzag4Q4oaqm+atzWdMgMQgsN3B5uQuZi6Qq3IEcz4frqqo5qg6zJh4iKZuE4TVfY1gZibBBBxg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreKa4/FdUvAcKPIuh0/y3Rio0AigvPLuXO/MHeQX85sySrdbs7aYaq32DVM6ulJTbusevIKgB7hqcKSdXyPaB+Vk2S6qo08z6ynPvziNxXd0t8uJnMX9iQ1cziAIQOz65ARaqWke4PZDj06jpKxG+d9eSRSHG99W+n24oyXr/2b9HOtvi9KglzUQaHLhNUxNDYnWfR1p08bohrKu8g3UyabFCvI//2+F6Za55hfU6sLELcWLM4cKCBOvKmBNuwC0Xg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHaKWwx1w+WQg6f7c0Ou7rMu+VZwVM5aenHFkSuK7c9JF8zlHtKwfwTbtcahkAfua/SwlW94CtaTtdYhzizhpWJ1iWXahJrLG6r9pnzh+yjhvH2B9AbC3gGjvZsyouqrw2ACDEcSNQsHTy4BP1s/hpvIFHhqfusSMfE+MfcooOE7QTf7hIR7/gKcqG5DNsKHOy+KwNgZtqXVcHvEE2cL9vzZZ4vNXn6/kZVr9VysS7lMs1DtMhYCLLL5lR+JWBlR53Nh8VZhAM3oeh6Rfg4oJwhAEiFvlmSl/PWweBAcHHhy4PXcFRC1P0it4THMO7JCzqeAheSiVdHXu3GsYMkcP1pq0Wmb18HBc6l8B1A/INkdWffB6sxmSPR01zQvEq01JLJYYfluALww//f4avbEIueJbdxcy1o0NLlMZz5j9SAKk+xGLvpdWAI+rzcgUL8n6wPm+FFtTYgw0nD1rXsJAgP4O2ATK2QA8z7NSogYWhpe9QTfuLIOgGCDK5fie4RUhhl2W59lihvsblx8DIws8+Ws67Cq9s6AwleLzqsmQ1Xkx7DvkAWojvpBJ1FfJAQB549wHNiykouziC/eXbn9xx6s=</Encrypted>]]>&ImportUserDefinedDeclare;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eObpFygzK6UeeRQDRJ38o3lkkhqL8oqfk/b0xHVMmsEPC1UlvAt/nH4uSldautFufgYAjcKyauOakgMP7tWcOHeHIRxaFrrAC4iCcIl/gvlRSJAoLS9unaPddFkB9gVcOyNDT9ErqAIG5FWhyecYgM+IAzsnlsN5TMXpdIWcjkbZFjRiyRHHo8PH7bh5o9+bg==</Encrypted>]]>&ImportUserDefinedFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6DO3T3/r34Vv6fr1w2KPQ2T+5iXhfcefgTsZp4QL0zda8yOSr2jOABCGdehjzyElBiz6C7OSaeQuhqVGU1g55HW57qp088VgPe7kprWeDGBSeEEhhuXT28vouJlptcJ7McMncUrHglesE8h/mM92DSwnaqc/NztpfALCF3RY2TyHIWW74hEKbXi9ESa5ykxCOYzAbfK6+1ugs7vtg7FfcWsnH0qJVxP0VYn+28lT6MXuZBAKi3FBte+ur/G/q3zzWYxEh645xvWKfhoF9Fd3AwwQyzRqOfhzjUs6H+Wdn7Agn3grUiqFrgnTg1RvhNmlMtO/ALs3raPwiqrkvVt9pc8/m3oNOl2/jlyMB0VOiWqblTyMN4tZg+43UJMeNnzzXitNpRnX/7SbuGyAezPlKkf0ELlSRCXQtTDteZZ6RQLHJtw+z7BZWSCv2bAGmHyu/EmPZnAokzw3EYnheOMGnWoEyz/zUGd3JYPx/pw2TCtlP6s1kSte2y16RuWeTWF3P/+ce+acJYg0HZf2yl9xk5EwYfjRijMFrO6hDiF1AEKIElRJ+bipu7C4xs+oEXzVRb3YUSppvkBOuBjnCiZ57gM9vUtCknNP3vXtAUtM0vgCIGCluGaki7/BBfOjF5eYow==</Encrypted>]]>&ImportUserDefinedSetItem;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22RVHZfdf6Td9252RCbgUs92m1qX8cNbHKWitX6IRmeHfY8DYqF8yEe2U7QJBNYO/ButDQRJbI06k9yROV03VmNG4CP0MMefr/YNYt+JCZqQ4RcTVKZO2BKQ8BmK2Br8zWCNs/xc/7hSmNirGorbhIUGNG6s1wC/IMeb45PKuzueZpnROLIVWsf9vJbawK/YYYehoPaNnq6X1YWLy3ReQGha8XzD7wWbT58r/4qFyDcZ3BZZhF6LJq79ZG6zjhsMtSJ2A0gMq+1FYroOvRCgkDqB22gNmBKn9oVACXG1obZPrJQ95ZCt5gckfuNAUtf73tHIUbgCe3M+1RyGHl3wQg55yYbpOIR5zLA6d4ir/aRPbkyF5R4yKiveMqePBQX8jE+haV1v9KJ0UfLw/rkxBQLOWobz29UUgRDBd6qh+6XOSg0KhIaZhymNZYPdcKRihsA==</Encrypted>]]>
    </text>
  </script>

  <response>
    <action id="GetTicket">
      <text>
        &UploadCreateTicket;<![CDATA[<Encrypted>&JFAg3c674j2f8bRB56rmcAwBgUhlM+p12yj1evxkfcDUP9CeRQRDt/OIcHdxnMr2oXPo5oho2Ss1hSl27MFMjg==</Encrypted>]]>
      </text>
    </action>
  </response>

  &UploadButtonCss;
</dir>