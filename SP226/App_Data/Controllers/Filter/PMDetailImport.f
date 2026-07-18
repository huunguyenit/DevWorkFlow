<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "PMDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadCommand SYSTEM "..\Include\Command\UploadCommand.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
  <!ENTITY % UserDefinedImport SYSTEM "..\Include\Javascript\UserDefinedImport.ent">
  %UserDefinedImport;

  <!ENTITY % BaseCurrency SYSTEM "..\Include\BaseCurrency.ent">
  %BaseCurrency;
]>

<dir table="d72$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
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
        <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22VKaBUrspbPJs/UZF6A52n4PVYgDw3m/NJQkimjLqjQLz6jMSkPrYRwfqBpNJX5Rt2L4n90eXvudY6o5AQDPIZe81Be2HkLmSFbFRg2eqw9sBmBvxTyZTSYeaxJQwt09Ow==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&hAZbP1KooHpS1/rCRYpD3pzmE5chSLTUsRU/oQi8qvIvTBRzoIephrRkZtXbFyoIrBELwMw5+m6gUxWzpcVL2LHh/Sf1f1lPH0Mj8Cye+hD09y4FXRK7ap20f9QmL5AO810cPdM2uWBYyrwSvlS82/xE2g4u3L2w2Ymt+UsTCJ1YC+JC9A75+/qZ9F3aMcTTQ4Hy9V/Yqa5WTNlSYRsDJEs2K/jwlz58xleu43D8MVndr0nz82BpyLXglSLy9zKHvjv5WL4Jmlt1fqCB1oQLPLvEgaOC0DqmR544CSoUSrxrCh/9zxaqENYSH3SAOFyYcWBquKvYi+9o+BVxtjvB52l2E9365HF0xX0lREpSuGybNMUyWTQndoC+68K2xcnzFshCQV/lvIuqPyC3+Uf1Rg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&C2oX7For6o4fC973pcIHelHwvPk9nrF5yAaoE7lP7CdE31r59JFoWuQLo9Nv+ie4UyHbkkMWI1mWb/dsH44qTKRB/EJWNopejUwt7/l37AeTzy5fiAY7HIa28CYWQVU8h2B+Kgg5XLz0zae6FsdoQ71JurFTzSoNEBvu/mMvHLQ=</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&40Tg4Lrc/5UuRfmdgw9mHE2LfCeI0QcWQ2XR/cdsKh8Tv/iKTfMPDQIgYTdtUfKsuwRTg+1MOc2Z+8tOPpdIyWnHy41VSvq87G8p2+daqPQRD2RQjB+xPdFzQ9HHrybTodgHQViGrmc2OZyiUm2+HMddM435k2OPqJYP07e5c7f22n7y2osVuj3tnFqe/XNtgREr/xko7CmbWLYc5VMbERkCfpegCGCG4b2CP93dGP5cTS/0Uf7oRuXWpjKnCh8z9xN3IBWo5vQv4dfwwaQxgk7cfqmuQs/L9V5qKzcLHlXQCEDy6cTOnT1R5iZrra9NN+9IpO2AdSUk7iE1I7usbFzcu83VXNne0FJJUoTqHpysmCGHwj52XTiuYKzw5/ut4QrLab1ej0K+w0GHrDjkeKj2kDCCpDdsS0JchJKM9me+lRVlIONYewVfQ+w/P5v1wiydZcHU4GPnTt7GaapeV52F5fGuGF9S+egj2UNwHvaFWk/nzYl47yiBe1virgwt0O9bHZSc+LCrzgYbT2QLeQqyyhEK7NOTaIx11T1dWcg=</Encrypted>]]>
      </text>
    </command>
  </commands>

  <script>
    <text>
      &UploadScript;
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreKa4/FdUvAcKPIuh0/y3Rio0AigvPLuXO/MHeQX85sySrdbs7aYaq32DVM6ulJTbusevIKgB7hqcKSdXyPaB+Vk2S6qo08z6ynPvziNxXd0t8uJnMX9iQ1cziAIQOz65ARaqWke4PZDj06jpKxG+d9eSRSHG99W+n24oyXr/2b9HOtvi9KglzUQaHLhNUxNDYnWfR1p08bohrKu8g3UyabFCvI//2+F6Za55hfU6sLELcWLM4cKCBOvKmBNuwC0Xg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHaKWwx1w+WQg6f7c0Ou7rMu+VZwVM5aenHFkSuK7c9JF8zlHtKwfwTbtcahkAfua/SwlW94CtaTtdYhzizhpWJ1iWXahJrLG6r9pnzh+yjhvH2B9AbC3gGjvZsyouqrw2ACDEcSNQsHTy4BP1s/hpvIFHhqfusSMfE+MfcooOE7QTf7hIR7/gKcqG5DNsKHOy+KwNgZtqXVcHvEE2cL9vzZZ4vNXn6/kZVr9VysS7lMs1DtMhYCLLL5lR+JWBlR53Nh8VZhAM3oeh6Rfg4oJwhAEiFvlmSl/PWweBAcHHhy4PXcFRC1P0it4THMO7JCzqbxGrBHhK6jPdktHSf/CNrs1qIGFgg0HEi6EdRi70uM3XtB8nWNBdPJuxZBn0id7BFl8EQNOMgfIHrWs/COx4gI=</Encrypted>]]>&PMDetailImportFields.RefIndex;<![CDATA[<Encrypted>&SxxtY1ZSBbLyKRcfZfFu3NzcoGGVzvPZZa0Mom/Stpzs3lrUSnK+Kb+fqMNXii6A</Encrypted>]]>&PMDetailImportFields.EditItemAccountIndex;<![CDATA[<Encrypted>&kU4s8t0aIOG3JJlst//K4LPLBIlT+LBi6osXq6jsL+40PY/KBqzUL/O/UHwxvOST</Encrypted>]]>&PMDetailImportFields.MultiUOMIndex;<![CDATA[<Encrypted>&Bh+HJw6FhwTUoE17zinoM2ySxsZnKzIP2djNqa0XV86ZVgR1U+/85WbzDrJAEYCE</Encrypted>]]>&PMDetailImportFields.TaxDebitIndex;<![CDATA[<Encrypted>&XpAcZ7HRWjEUU2F2AGbQf72zP2RBSMrkpLcmMdjfEsxWJm8XS606/FggDiuVaO+IS8O82COpLOP5gSlR0hOMvgCSnl8185gQn/z99kLe1U8qXXVnKH+0utiiB8JlOGDrlRQYRoIIMZ4Ilct6pJdTo5gugGwjDMarz5aKmT4TdHOpdfuRzLoZr7hXo1Ne/s5kTBsjqTWfs6MELCRH0QGA0g==</Encrypted>]]>&ImportUserDefinedDeclare;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eObpFygzK6UeeRQDRJ38o0C0RrUtI3bOWHxn480+wgFwxlAFd3wLpJToQA8IMsLGs392pvgg+jLpdRCQmALSgqTqKEA+oRvNKszHwp7C8rC/ZwfJcY8sOoDmT2v50IMgGKA20i7BF0OSqD/MMcnGiElklu+eXXT8mWt73Jf3RESA14DHh+WC/9Y0/PDXVnxgclaEjn8lujgXMDZDAKCkUHSq5WMGgmWD4ZbIw1YA3Mh</Encrypted>]]>&ImportUserDefinedFields;<![CDATA[<Encrypted>&4Z3iXjUo/EHcYSchZnZy5STTJZXyhd0GMZ4QLHymdq5nWTnSrGi4UZaUqivM2Qup6jDGjZ1AuMRFoRor3fAXzA==</Encrypted>]]>&PMDetailImportFields.Process;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6DO3T3/r34Vv6fr1w2KPQ2T+5iXhfcefgTsZp4QL0zda8yOSr2jOABCGdehjzyElBiz6C7OSaeQuhqVGU1g55HW57qp088VgPe7kprWeDGBSeEEhhuXT28vouJlptcJ7McMncUrHglesE8h/mM92DSwnaqc/NztpfALCF3RY2TyHIWW74hEKbXi9ESa5ykxCOYzAbfK6+1ugs7vtg7FfcWsnH0qJVxP0VYn+28lT6MXuZBAKi3FBte+ur/G/q3zzWTU9fuO6Re7VVwmRqY6Iy2mM45TlEjveXqBs8sMhPUxR9LPKNgpmKcqoYcNe0C16+rZJyRx4IQzL9k3rJNslFsTsCrkClcLv/oU13h7o2GXuKH3Yd7wvON9e4MIgdhH4HRBZFFeGzGUM8mUVwQaU1ZMjowSJHzcQwXNss4jBkZKk+0jILlp890ZhZNleREtQUeSmmXm+9D2RiaNpcXLadL12PziPwX3PgbNg+il5esTu0Q+IgAYj6Ya98TuLl0GMAG9T7qe9HRha3Hxe/zt4UDRvaKRoQqQ0EgLHO8EMMXobDtEQTjQlf4EFroNZ+iIE29Pz6+0l32witutlexud38+kvyA5l+Jx5uM55TAAwKTwvIRWTmSG3hnRSnFV50n7nq9AA9KjkgbTuYbu1W0/qNE=</Encrypted>]]>&ImportUserDefinedSetItem;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22bQVtonuw+E//uZ6QGgAynA=</Encrypted>]]>&PMDetailImportFields.ConditionalBegin;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eskUGPMqnhZnT70Y7nGf4gVAVU1L9I3sNu7FU2eMpVFG5Lns+I5qUkJnoSSYYmFJMlJ5GU18HJYGOx8mOmXNQK28R6Jc3zxj8azPxJE650M6g8OwNXp29/czZ8mt5qj3inrkUDwFtQt9r+sT5ZIyvb6u5B19gBFt5/j7hbVGoooiuj0Ee+6B2IZAlmwPIYN/w==</Encrypted>]]>&PMDetailImportFields.ConditionalEnd;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22e12elxXrtPy5qmMJ8Y7N4iyJ9xL8r9Sno9JX1fUL8h3aFUSzdwpjXA6+keqeHZhRDQ4q6kf3b3hnFiTtsGFMvPXbwlWcSnik17XZ0xMfPGFPtgSKa9gSw3W/GwYUhfTZV787o1knOlHAUhlCFfpvVN8VpQqW9jYc6D/byTAPW+Miw9SIpXQfMIrtr7zMCYZVFKU2QXgKlbYg3+TmEf59jpd2DhZgtEfjsEcX3MbXjBTA9TD1t3H5/mGof75X20p1JZQbke1Vc/7yHQpljg3Vd7A5LaeEm2a0SYwGlJYeYOPkl0YedmnZgeG3cEijYZl8iIfWdOMi/gY0KY9n9s9qXjPj7GIa54tsqbNxgVe/e+xFpfDTCkq0zIRJgGG1c75SayZg2Y9+UfurCb+vyEUq2Y6+FTcpFKpR45oaALD73/6ww4RbT3JLCLTY7KK1xpsTNYxAxC+e3VwS3Yv2OhtIqS25DkToV9jMkojB10+rA0XdTexGwE/GXlz1/z0MmJjnjbr9xSWwBuaOYvXgxyyduyOjzTly5vBtYnEN+edORjD22OLpRWUgQ9GMpX85Ig1krcRlMLVQfuiKB4xdXp++mY=</Encrypted>]]>
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