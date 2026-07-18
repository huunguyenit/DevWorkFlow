<?xml version="1.0" encoding="utf-8"?>

<!DOCTYPE dir [
  <!ENTITY Identity "CDDetailImportForm">
  <!ENTITY UploadButtonCss SYSTEM "..\Include\XML\ImageUploadForm.txt">

  <!ENTITY UploadCreateTicket SYSTEM "..\Include\XML\UploadCreateTicket.txt">
  <!ENTITY UploadField SYSTEM "..\Include\XML\UploadField.txt">
  <!ENTITY UploadScript SYSTEM "..\Include\Javascript\UploadScript.txt">

  <!ENTITY ImportUserDefinedFields "ma_vv, ma_bp, so_lsx, ma_sp, ma_hd, ma_phi, ma_ku">
  <!ENTITY % UserDefinedImport SYSTEM "..\Include\Javascript\UserDefinedImport.ent">
  %UserDefinedImport;
]>

<dir table="m51$000000" code="stt_rec" order="ngay_ct, so_ct" xmlns="urn:schemas-fast-com:data-dir">
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
      <![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22UssBP7mLwPvpIyeVnFY1WGIFudObEg0WpytXvCOVW+K</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&XBj6YDSBZrE7ldnLBomYreKa4/FdUvAcKPIuh0/y3Rio0AigvPLuXO/MHeQX85sySrdbs7aYaq32DVM6ulJTbusevIKgB7hqcKSdXyPaB+Vk2S6qo08z6ynPvziNxXd0t8uJnMX9iQ1cziAIQOz65ARaqWke4PZDj06jpKxG+d9eSRSHG99W+n24oyXr/2b9HOtvi9KglzUQaHLhNUxNDYnWfR1p08bohrKu8g3UyabFCvI//2+F6Za55hfU6sLELcWLM4cKCBOvKmBNuwC0Xg==</Encrypted>]]>&Identity;<![CDATA[<Encrypted>&EHNr0yT7yjRL1ZiIcCELHaKWwx1w+WQg6f7c0Ou7rMu+VZwVM5aenHFkSuK7c9JF8zlHtKwfwTbtcahkAfua/SwlW94CtaTtdYhzizhpWJ1iWXahJrLG6r9pnzh+yjhvH2B9AbC3gGjvZsyouqrw2ACDEcSNQsHTy4BP1s/hpvIFHhqfusSMfE+MfcooOE7QTf7hIR7/gKcqG5DNsKHOy+KwNgZtqXVcHvEE2cL9vzZZ4vNXn6/kZVr9VysS7lMs1DtMhYCLLL5lR+JWBlR53Nh8VZhAM3oeh6Rfg4oJwhAEiFvlmSl/PWweBAcHHhy4PXcFRC1P0it4THMO7JCzqeAheSiVdHXu3GsYMkcP1prUq+SDO8mQaCG4XYmvkTM1WasJUZMhqFqjM1UwVEtMYGDrXrkMW4A7pO4rxaH7VjneWHsjWMkvWEqjCfxZ7Ik1</Encrypted>]]>&ImportUserDefinedDeclare;<![CDATA[<Encrypted>&0s2Lg1fWBulqwUn0jadW4eObpFygzK6UeeRQDRJ38o2k2DP+rDyGIkwnr5JlbdEKHtxXLi38g/2GpAlzn4XNbobr6+A+kk7Li/4+DpkJp8h0t4EyZeT7QWXQC3UoSFBGjXI9b9UHOD6vftXr+NebbQ==</Encrypted>]]>&ImportUserDefinedFields;<![CDATA[<Encrypted>&+yRcV3XtE2MrYJ2A84tg6DO3T3/r34Vv6fr1w2KPQ2T+5iXhfcefgTsZp4QL0zda8yOSr2jOABCGdehjzyElBiz6C7OSaeQuhqVGU1g55HW57qp088VgPe7kprWeDGBSeEEhhuXT28vouJlptcJ7McMncUrHglesE8h/mM92DSwnaqc/NztpfALCF3RY2TyHIWW74hEKbXi9ESa5ykxCOYzAbfK6+1ugs7vtg7FfcWsnH0qJVxP0VYn+28lT6MXuZBAKi3FBte+ur/G/q3zzWTU9fuO6Re7VVwmRqY6Iy2lg7yJCEq1Qk4Bcpb16BvDMJCmcncPFrqZTuSjqevEeCutUxWaPpocQbhwcN0zTB7mAX4uHDZEwyarLEirY4pAIMZ/J0ks3KCNc0PmInp2e1Av+5mX+excuua/lgfJ2LVRHrFE9yNkSzmujTI1j/pfsfuRt3DCtY1Ncp/WqOYVOFSfpS5oIi1mXmEehkkNvU8QvU4lSpceEP3PQgyjvhUs4FHHFQbWw4ohDe4z5tcbobJCyvY4Eh9MHweFBIQSLI2U=</Encrypted>]]>&ImportUserDefinedSetItem;<![CDATA[<Encrypted>&ubZtUSPJWC7E3qu5YQA22Q5ySIdfpUBUmeiPNemf5t6BIHviKe4FL39trDJgcvea+h4bLaCtPuGXMkkWV8yjrPmtBmNeEBchrydO/lIfTZEAymSWIUFGmp/RCLP3zgqb+GLUFeylrBPyCpu3vbY4K4ldl87wwsBfc4OJ38F1wUtsTrpT25CAtp0C+8wfAv65rgtY7zM6P1IDIQq+bqkY8Pk3ziGczRJlhZ6H8NPBm0GUCvmUttjMOr2ZyjOi74an16xWm3H4bjIJiu9kd6ohnkELiTjfU/Ta0BwJqNY2oLddwhe2Suo77qlTevuYPFrGLatzsfnMgy8KuJ24ISs25sZDeZQfOG1KA6WoCdptCtHwu5w6+IQybdfbJLRbNtrcBhASiS9R94O3tQ8xsyg2seGqzBVcy6IdeWj/LJ2FL+Azm/+jWphoMcHWyhKoAX3NBIV6J6oo4psbH/HHby9ByLuooHWLsGzhl0YjGt0FMQ8=</Encrypted>]]>
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